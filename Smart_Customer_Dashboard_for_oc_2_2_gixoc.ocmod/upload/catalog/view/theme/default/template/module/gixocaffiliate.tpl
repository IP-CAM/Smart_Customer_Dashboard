<style><?php if ($els_css) { ?><?php echo $els_css; ?> <?php } ?></style>
<div class="list-group">
  <?php if (!$logged) { ?>
  <a href="<?php echo $login; ?>" class="list-group-item"><?php echo $text_login; ?></a>
  <a href="<?php echo $register; ?>" class="list-group-item"><?php echo $text_register; ?></a>
  <a href="<?php echo $forgotten; ?>" class="list-group-item"><?php echo $text_forgotten; ?></a>
  <?php } else { ?>
  <?php if ($els) { ?>
  <?php foreach ($els as $el) { ?>
  <a href="<?php echo $el['url']; ?>" class="<?php echo $el['class_el']; ?>" id = "<?php echo $el['id']; ?>"><?php echo $el['name']; ?></a>
  <?php } ?>
  <?php } ?> 
  <?php } ?>
</div>