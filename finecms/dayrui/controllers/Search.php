<?php

/**
 * FineCMS 公益软件
 *
 * @策划人 李睿
 * @开发组自愿者  邢鹏程 刘毅 陈锦辉 孙华军
 */
 
class Search extends M_Controller {


    /**
     * 内容搜索
     */
    public function index() {
//var_dump($_GET);exit;
		// 搜索参数
		$get = $this->input->get(NULL, TRUE);
		$get = isset($get['rewrite']) ? dr_rewrite_decode($get['rewrite']) : $get;


        if(!empty($get['shx'])) {
            $inputshx = "<li class='selecting' id='selectA'><a href='javascript:;' id='shx' class='{$get['shx']}'>shx</a></li>";
        }
        if (!empty($get['shhj'])) {
            $inputshx .= "<li class='selecting' id='selectB'><a href='javascript:;' id='shhj' class='{$get['shhj']}'>shhj</a></li>";
        }
        if (!empty($get['hs'])) {
            $inputshx .= "<li class='selecting' id='selectC'><a href='javascript:;' id='hs' class='{$get['hs']}'>hs</a></li>";
        }
        if (!empty($get['gstx'])) {
            $inputshx .= "<li class='selecting' id='selectD'><a href='javascript:;' id='gstx' class='{$get['gstx']}'>gstx</a></li>";
        }
        if (!empty($get['jixiang'])) {
            $inputshx .= "<li class='selecting' id='selectE'><a href='javascript:;' id='jixiang' class='{$get['jixiang']}'>jixiang</a></li>";
        }
        if (!empty($get['ssfww'])) {
            $inputshx .= "<li class='selecting' id='selectF'><a href='javascript:;' id='ssfww' class='{$get['ssfww']}'>ssfww</a></li>";
        }
        if (!empty($get['qhlx'])) {
            $inputshx .= "<li class='selecting' id='selectG'><a href='javascript:;' id='qhlx' class='{$get['qhlx']}'>qhlx</a></li>";
        }

        $this->template->assign('inputshx', $inputshx);
		$catid = (int)$get['catid'];
		$_GET['page'] = $get['page'];
        $page = max(1, (int)$_GET['page']);
		$get['keyword'] = str_replace(array('%', ' '), array('', '%'), urldecode($get['keyword']));
		unset($get['c'], $get['m'], $get['id'], $get['page']);
		if (!$get['mid']) {
            $this->msg(fc_lang('缺少mid参数'));
        }

        $this->dir = $get['mid'];
        $this->_module_init($this->dir);

        $this->load->model('search_model');
        $this->search_model->init($this->dir);

        list($total, $sql) = $this->search_model->get($get, $page);

        $category = $this->get_cache('category-'.SITE_ID);
		list($parent, $related) = $this->_related_cat($category, $catid);

        $this->template->assign(dr_search_seo($this->module[$this->dir], $get, $page));
		$this->template->assign(array(
		    'mid' => $get['mid'],
			'cat' => $category[$catid],
			'get' => $get,
			'params' => $get,
			'caitd' => $catid,
			'parent' => $parent,
			'related' => $related,
			'keyword' => $get['keyword'],
			'urlrule' => dr_search_url($get, 'page', '{page}'),
			'search_total' => $total,
			'search_sql' => urlencode($sql),
		));


        if(IS_AJAX)
        {

            $this->template->display("ajax_list.html");
            exit;

        }
		$this->template->display($catid && $category[$catid]['setting']['template']['search'] ? $category[$catid]['setting']['template']['search'] : 'search.html');
    }

}