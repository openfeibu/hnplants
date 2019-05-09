##############**********接收参数***********####################
		$sort_name = strim($_REQUEST["sort"]);
		if($sort_name!="current_price"&&$sort_name!="buy_count")$sort_name="";
		if($sort_name)$url_param['sort'] = $sort_name;
		
		$sort_type = strim($_REQUEST['type'])=="asc"?"asc":"desc";
		if($_REQUEST['type'])$url_param['type'] = $sort_type;
		
		$dtag = intval($_REQUEST['dtag']);
		if($dtag)$url_param['dtag'] = $dtag;
		
		$pr = intval($_REQUEST['pr']);//价格阶梯序号
		if($pr)$url_param['pr'] = $pr;
##############**********接收参数***********####################

		//输出排序
		$sort_row_data = array();
		/* $sort_row_data = array(
			"sort"	=> array(
				array("name"=>"xxx","key"=>"xxx","type"=>"desc|asc","url"=>"xxx","current"=>"true|false")		
			),
			"range"	=> array(
				array
				(
					array("name"=>"xxx","url"=>"xxx","selected"=>"true|false"),
					array("name"=>"xxx","url"=>"xxx","selected"=>"true|false"),
					array("name"=>"xxx","url"=>"xxx","selected"=>"true|false"),
					array("name"=>"xxx","url"=>"xxx","selected"=>"true|false"),
				)
			),
			"tag"	=> array(
				array("name"=>"xxx","url"=>"xxx","checked"=>"true|false")
			)		
		); */
		
		//默认排序
		$tmp_url_param = $url_param;
		unset($tmp_url_param['type']);
		unset($tmp_url_param['sort']);
		if(empty($url_param['sort']))
			$current = true;
		else
			$current = false;
		$sort_list[] = array("name"=>"默认排序","current"=>$current,"url"=>url("index","cate",$tmp_url_param));
		
		//价格排序
		$tmp_url_param = $url_param;
		if($tmp_url_param['sort']=="current_price")
		{
			if($tmp_url_param['type']=="desc")
			{
				$tmp_url_param['type'] = "asc";
				$c_sort_type = "desc";				
			}
			else
			{
				$tmp_url_param['type'] = "desc";
				$c_sort_type = "asc";
			}
			$current = true;
		}
		else
		{
			$tmp_url_param['sort'] = "current_price";
			$tmp_url_param['type'] = "desc";
			$c_sort_type = "desc";
			$current = false;
		}
		$sort_list[] = array("name"=>"价格","key"=>"current_price","type"=>$c_sort_type,"current"=>$current,"url"=>url("index","cate",$tmp_url_param));
		
		//销量排序
		$tmp_url_param = $url_param;
		if($tmp_url_param['sort']=="buy_count")
		{
			if($tmp_url_param['type']=="desc")
			{
				$tmp_url_param['type'] = "asc";
				$c_sort_type = "desc";
			}
			else
			{
				$tmp_url_param['type'] = "desc";
				$c_sort_type = "asc";
			}
			$current = true;
		}
		else
		{
			$tmp_url_param['sort'] = "buy_count";
			$tmp_url_param['type'] = "desc";
			$c_sort_type = "desc";
			$current = false;
		}
		$sort_list[] = array("name"=>"销量","key"=>"buy_count","type"=>$c_sort_type,"current"=>$current,"url"=>url("index","cate",$tmp_url_param));
		
		$sort_row_data['sort'] = $sort_list;
		
		//标签筛选 
		/* 
		多套餐 2 t
		随时退 6 t 
		七天退 7 t
		免运费 8 t
		满立减 9 t
		*/
		$tag_condition = "";
		for($t=1;$t<10;$t++)		
		{			
			if($t!=1&&$t!=3&&$t!=4&&$t!=5)
			{
				$checked = false;
				if(($dtag&pow(2,$t))==pow(2,$t))
				{
					$checked = true;
				}
				$tmp_url_param = $url_param;
				$tmp_url_param['dtag'] = $dtag^pow(2,$t);
					
				$dtags[] = array(
						"name"	=>	lang("DEAL_TAG_".$t),
						"checked"	=>	$checked,
						"url"	=>	url("index","cate",$tmp_url_param)
				);
			}
			
		}	
		$ext_condition = " d.deal_tag&".$dtag."=".$dtag." ";
		$sort_row_data['tag'] = $dtags;
		
		
		//价格区间
		$price_level = array(
				array("min"=>"0","max"=>"100"),
				array("min"=>"100","max"=>"500"),
				array("min"=>"500","max"=>"2000"),
				array("min"=>"2000","max"=>"0")
		);
		
		$tmp_url_param = $url_param;
		unset($tmp_url_param['pr']);
		$all_selected = false;
		if(empty($url_param['pr']))
			$all_selected = true;
		$price_range[] = array("name"=>"全部价格","url"=>url("index","cate",$tmp_url_param),"selected"=>$all_selected);
		
		foreach($price_level as $k=>$v)
		{
			$tmp_url_param = $url_param;
			$tmp_url_param['pr'] = $k+1;
			$current_selected = false;
			if($url_param['pr']==($k+1))
			{
				$current_selected = true;
			}
			if($v['min']==0&&$v['max']>0)
			{
				$range_name = $v['max']."元以下";
			}
			else if($v['max']==0&&$v['min']>0)
			{
				$range_name = $v['min']."元以上";
			}
			else 
			{
				$range_name = $v['min']."-".$v['max']."元";
			}
			$price_range[] = array("name"=>$range_name,"url"=>url("index","cate",$tmp_url_param),"selected"=>$current_selected);
		}
		
		if($price_level[$pr-1])
		{			
			$price_range_item = $price_level[$pr-1];	
					
			if($price_range_item['min']>0)
				$ext_condition .= " and d.current_price >= ".$price_range_item['min']." ";
			
			if($price_range_item['max']>0)
				$ext_condition .= " and d.current_price <= ".$price_range_item['max']." ";
		}
		
		$ext_condition.=" and  d.buy_type <> 1 and d.is_shop = 1 ";
		$sort_row_data['range'][] = $price_range;
		$GLOBALS['tmpl']->assign("sort_row_data",$sort_row_data);

		//获取排序条件 
		if($url_param['sort'])$sort_field = "d.".$url_param['sort']." ".$url_param['type'];
		require_once APP_ROOT_PATH."app/Lib/page.php";
		$page = intval($_REQUEST['p']);
		if($page==0)
		$page = 1;
		$limit = (($page-1)*app_conf("DEAL_PAGE_SIZE")).",".app_conf("DEAL_PAGE_SIZE");
		
		$condition_param = $url_param;
		$condition_param['city_id'] = $GLOBALS['city']['id'];
		
		if($GLOBALS['kw'])
		{
			$ext_condition.=" and d.name like '%".$GLOBALS['kw']."%' ";
		}
		$deal_result  = get_goods_list($limit,array(DEAL_ONLINE,DEAL_NOTICE),$condition_param,"",$ext_condition,$sort_field);
		
		$deal_list = $deal_result['list'];		
		$total = $GLOBALS['db']->getOne("select count(*) from ".DB_PREFIX."deal as d where ".$deal_result['condition'],false);
		$page = new Page($total,app_conf("DEAL_PAGE_SIZE"));   //初始化分页对象
		$p  =  $page->show();
		$GLOBALS['tmpl']->assign('pages',$p);
		$GLOBALS['tmpl']->assign('deal_list',$deal_list);
				
		$GLOBALS['tmpl']->display("list.html");