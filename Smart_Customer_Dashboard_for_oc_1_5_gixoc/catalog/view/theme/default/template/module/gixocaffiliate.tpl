<style><?php if ($els_css) { ?><?php echo $els_css; ?> <?php } ?></style>
<div class="box">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content">
    <ul>
      <?php if (!$logged) { ?>
      <li><a href="<?php echo $login; ?>" class="list-group-item"><?php echo $text_login; ?></a></li>
      <li><a href="<?php echo $register; ?>" class="list-group-item"><?php echo $text_register; ?></a></li>
      <li><a href="<?php echo $forgotten; ?>" class="list-group-item"><?php echo $text_forgotten; ?></a></li>
      <?php } else { ?>
      <?php if ($els) { ?>
      <?php foreach ($els as $el) { ?>
      <li><a href="<?php echo $el['url']; ?>" class="<?php echo $el['class_el']; ?>" id = "<?php echo $el['id']; ?>"><?php echo $el['name']; ?></a></li>
      <?php } ?>
      <?php } ?> 
      <?php } ?>
    </ul>
  </div>
</div>