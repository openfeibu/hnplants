<?php if ($fn_include = $this->_include("header.html")) include($fn_include); ?>
		<div class="content" id="content">
		<?php $rt = $this->list_tag("action=module module=news catid=$catid page=1 pagesize=12 urlrule=index.php?page=[page] order=displayorder,updatetime"); if ($rt) extract($rt); $count=count($return); if (is_array($return)) { foreach ($return as $key=>$t) { ?>
			<ul class="img-list">
				<li>
					<a href="<?php echo $t['url']; ?>">
						<img src="<?php echo dr_get_file($t['thumb']); ?>" alt="">
						<p><?php echo $t['title']; ?></p>
					</a>
				</li>
			</ul>
		<?php } } ?>
		</div>
		<div class="num">
			<ul >
			<?php echo $pages; ?>
			</ul>
		</div>
<?php if ($fn_include = $this->_include("footer.html")) include($fn_include); ?>