<?php if ($fn_include = $this->_include("header.html")) include($fn_include); ?>
<div class="body" id="ajax-body">
	<?php if ($fn_include = $this->_include("ajax_list.html")) include($fn_include); ?>
</div>
<?php if ($fn_include = $this->_include("footer.html")) include($fn_include); ?>