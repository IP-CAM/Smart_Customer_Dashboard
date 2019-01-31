<?php echo $header; ?>
<style><?php if ($els_css) { ?><?php echo $els_css; ?> <?php } ?></style>
<?php if ($success) { ?>
<div class="success"><?php echo $success; ?></div>
<?php } ?>
<?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <h1><?php echo $heading_title; ?></h1>
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
        <hr>
       <?php } ?>
      <?php } ?>
  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>