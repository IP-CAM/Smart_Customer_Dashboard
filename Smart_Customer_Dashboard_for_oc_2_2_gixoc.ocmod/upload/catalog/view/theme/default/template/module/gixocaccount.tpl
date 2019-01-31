<?php echo $header; ?>
<style><?php if ($els_css) { ?><?php echo $els_css; ?> <?php } ?></style>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <?php if ($groups) { ?>
       <?php foreach ($groups as $group) { ?>
        <div id="<?php echo $group['id']; ?>" class="<?php echo $group['class_el']; ?>"><?php echo $group['name']; ?></div>
        <ul class="list-unstyled">
        <?php foreach ($group['els'] as $el) { ?>
          <div class="<?php echo $el['class_el']; ?>" >
            <a href="<?php echo $el['url']; ?>"><img src="<?php echo $el['image']; ?>" alt="<?php echo $el['name']; ?>" ><div id = "<?php echo $el['id']; ?>"><?php echo $el['name']; ?></div></a>
          </div>
        <?php } ?>
        </ul>
        <div class="clearfix"></div>
       <?php } ?>
      <?php } ?>
    <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?> 