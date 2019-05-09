<div class="content" id="content">
    <?php $rt = $this->list_tag("action=sql module=$mid sql='$search_sql' page=1 pagesize=12 urlrule=$urlrule"); if ($rt) extract($rt); $count=count($return); if (is_array($return)) { foreach ($return as $key=>$t) { ?>
    <ul class="img-list">
        <li>
            <a href="<?php echo $t['url']; ?>" target="_blank">
                <img src="<?php echo dr_get_file($t['thumb']); ?>" alt="">
                <p><?php echo $t['title']; ?></p>
            </a>
        </li>
    </ul>
    <?php } } ?>
</div>
<div class="num page">
    <ul >
        <?php $pages = str_replace("href","ajax-href",$pages); echo $pages; ?>
    </ul>
</div>