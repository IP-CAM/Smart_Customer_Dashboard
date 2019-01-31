<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <div id="tabs" class="htabs">
        <a href="#tab-design"><?php echo $entry_main; ?></a>
        <a href="#tab-customer"><?php echo $entry_customer; ?></a>
        <a href="#tab-affiliate"><?php echo $entry_affiliate; ?></a>
      </div>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <div id="tab-design">
          <table class="form">
            <tr>
              <td><?php echo $entry_status; ?></td>
              <td>
                <select name="gixocaccount_status">
                  <option value="1" <?php if ($gixocaccount_status) { ?>selected="selected"<?php } ?>><?php echo $text_enabled; ?></option>
                  <option value="0" <?php if (!$gixocaccount_status) { ?>selected="selected"<?php } ?>><?php echo $text_disabled; ?></option>
                </select>
              </td>
            </tr>
          </table>
        </div>
        <div id="tab-customer">
          <div class="content">
            <div class="vtabs">
              <a href="#tab-cgroups"><?php echo $entry_groups; ?></a>
              <a href="#tab-cgroup"><?php echo $entry_el; ?></a>           
            </div>
            <div id="tab-cgroups" class="vtabs-content">
              <div class="buttons">
                <a onclick="addGroups_customer();" class="button"><img src="view/image/add.png" alt="<?php echo $button_groups_add; ?>" />&nbsp;<?php echo $button_groups_add; ?></a>  
              </div>
              <br />
              <div id="groups_customer">
              <?php $groups_customer_row = 0; ?>
              <?php if ($gixocaccount_groups_customer) { ?>
              <?php foreach ($gixocaccount_groups_customer as $groups) { ?>
                <div class="<?php if ($groups['status']) { ?>success<?php } else { ?>warning<?php } ?>" id="groups_customer-row<?php echo $groups_customer_row; ?>">
                  <div style="float:right;"  class="buttons">
                    <a onclick="confirm('<?php echo $text_confirm; ?>') ? $('#groups_customer-row<?php echo $groups_customer_row; ?>').remove() : false;" class="button" style="float: right;"><img src="view/image/delete.png" alt="<?php echo $button_delete; ?>" />&nbsp;<?php echo $button_delete; ?></a>  
                  </div>
                  <table class="form">
                    <input type="hidden" name="gixocaccount_groups_customer[<?php echo $groups_customer_row; ?>][id]" value="<?php echo $groups_customer_row; ?>" id="input-id_groups_customer<?php echo $groups_customer_row; ?>" />
                    <tr>
                      <td><?php echo $entry_name; ?></td>
                      <td>
                      <?php foreach ($languages as $language) { ?>
                        <input type="text" name="gixocaccount_groups_customer[<?php echo $groups_customer_row; ?>][name][<?php echo $language['language_id']; ?>]" value="<?php echo isset($groups['name'][$language['language_id']]) ? $groups['name'][$language['language_id']] : ''; ?>" class="form-control" /><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />
                        <?php if (isset($error_name[$language['language_id']])) { ?>
                        <div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>
                        <?php } ?>
                      <?php } ?>
                      </td>
                      <td><?php echo $entry_class_el; ?></td>
                      <td>
                        <input type="text" name="gixocaccount_groups_customer[<?php echo $groups_customer_row; ?>][class_el]" value="<?php echo $groups['class_el']; ?>" id="input-class-el" />
                      </td>
                   </tr>

                    <tr>
                      <td><?php echo $entry_color; ?></td>
                      <td>
                        <input type="text" name="gixocaccount_groups_customer[<?php echo $groups_customer_row; ?>][color]" value="<?php echo $groups['color']; ?>" id="input-color" size="6" class="color {required:false,hash:true} form-control" />
                      </td>
                      <td><?php echo $entry_color_hover; ?></td>
                      <td>
                        <input type="text" name="gixocaccount_groups_customer[<?php echo $groups_customer_row; ?>][color_hover]" value="<?php echo $groups['color_hover']; ?>" id="input-color-hover"  size="6" class="color {required:false,hash:true} form-control" />
                     </td>
                    </tr>

                    <tr>
                      <td><?php echo $entry_font; ?></td>
                      <td>
                        <input type="text" name="gixocaccount_groups_customer[<?php echo $groups_customer_row; ?>][font]" size="1" value="<?php echo $groups['font']; ?>" id="input-font" />px
                      </td>
                      <td><?php echo $entry_font_hover; ?><!-- <br><span class="help"><?php echo $help_info_font; ?></span> --></td>
                      <td>
                        <input type="text" name="gixocaccount_groups_customer[<?php echo $groups_customer_row; ?>][font_hover]" size="1" value="<?php echo $groups['font_hover']; ?>" id="input-font-hover" />px
                      </td>
                    </tr>

                    <tr>
                      <td><?php echo $entry_status; ?></td>
                      <td>
                        <select name="gixocaccount_groups_customer[<?php echo $groups_customer_row; ?>][status]" id="input-status" class="form-control">
                        <?php if ($groups['status']) { ?>
                          <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                          <option value="0"><?php echo $text_disabled; ?></option>
                        <?php } else { ?>
                          <option value="1"><?php echo $text_enabled; ?></option>
                          <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                        <?php } ?>
                        </select>
                      </td>
                      <td><?php echo $entry_sort_order; ?></td>
                      <td>
                        <input type="text" name="gixocaccount_groups_customer[<?php echo $groups_customer_row; ?>][sort_order]" size="1"  value="<?php echo $groups['sort_order']; ?>" id="input-sort-order" />
                      </td>
                    </tr>
                  </table>
                </div>
              <?php $groups_customer_row++; ?>
              <?php } ?>
              <?php } ?>
                </div>
            </div>
            <div id="tab-cgroup" class="vtabs-content">
              <div class="buttons">
                <a onclick="addEl_customer();" class="button"><img src="view/image/add.png" alt="<?php echo $button_el_add; ?>" />&nbsp;<?php echo $button_el_add; ?></a>  
              </div>
              <br />

              <div id="el_customer">
              <?php $el_customer_row = 0; ?>
              <?php if ($gixocaccount_el_customer) { ?>
              <?php foreach ($gixocaccount_el_customer as $el) { ?>
                <div class="<?php if ($el['status']) { ?>success<?php } else { ?>warning<?php } ?>" id="el_customer-row<?php echo $el_customer_row; ?>">
                  <div style="float:right;"  class="buttons">
                    <a onclick="confirm('<?php echo $text_confirm; ?>') ? $('#el_customer-row<?php echo $el_customer_row; ?>').remove() : false;" class="button" style="float: right;"><img src="view/image/delete.png" alt="<?php echo $button_delete; ?>" />&nbsp;<?php echo $button_delete; ?></a>  
                  </div>
                  <table class="form">
                    <input type="hidden" name="gixocaccount_el_customer[<?php echo $el_customer_row; ?>][id]" value="<?php echo $el_customer_row; ?>" id="input-id_el_customer<?php echo $el_customer_row; ?>" />
                    <tr>
                      <td><?php echo $entry_name; ?></td>
                      <td>
                      <?php foreach ($languages as $language) { ?>
                        <input type="text" name="gixocaccount_el_customer[<?php echo $el_customer_row; ?>][name][<?php echo $language['language_id']; ?>]" value="<?php echo isset($el['name'][$language['language_id']]) ? $el['name'][$language['language_id']] : ''; ?>"  class="form-control" /><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />
                        <?php if (isset($error_name[$language['language_id']])) { ?>
                        <div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>
                        <?php } ?>
                      <?php } ?>
                      </td>
                      <td><?php echo $entry_group; ?></td>
                      <td>
                        <select name="gixocaccount_el_customer[<?php echo $el_customer_row; ?>][customer_group_id]" id="input-gixocscd-group" class="form-control">
                          <?php foreach ($gixocaccount_groups_customer as $customer_group) { ?>
                            <?php if ($customer_group['id'] == $el['customer_group_id']) { ?>
                            <option value="<?php echo $customer_group['id']; ?>" selected="selected"><?php echo $customer_group['name'][$language_id]; ?></option>
                            <?php } else { ?>
                            <option value="<?php echo $customer_group['id']; ?>"><?php echo $customer_group['name'][$language_id]; ?></option>
                            <?php } ?>
                          <?php } ?>
                        </select>
                      </td>
                    </tr>

                    <tr>
                      <td><?php echo $entry_class_el; ?></td>
                      <td>
                        <input type="text" name="gixocaccount_el_customer[<?php echo $el_customer_row; ?>][class_el]" value="<?php echo $el['class_el']; ?>" id="input-class-el" />
                      </td>
                      <td><?php echo $entry_url; ?></td>
                      <td>
                        <?php echo $domain; ?><input type="text" name="gixocaccount_el_customer[<?php echo $el_customer_row; ?>][url]" value="<?php echo $el['url']; ?>" id="input-url" class="form-control" />
                      </td>
                    </tr>

                    <tr>
                      <td><?php echo $entry_image; ?></td>
                      <td>
                        <div class="image">
                          <img src="<?php echo $el['thumb']; ?>" alt="" id="thumb-image_el_customer<?php echo $el_customer_row; ?>" />
                          <input type="hidden" name="gixocaccount_el_customer[<?php echo $el_customer_row; ?>][image]" value="<?php echo $el['image']; ?>" id="input-image_el_customer<?php echo $el_customer_row; ?>" />
                          <br />
                          <a onclick="image_upload('input-image_el_customer<?php echo $el_customer_row; ?>', 'thumb-image_el_customer<?php echo $el_customer_row; ?>');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb-image_el_customer<?php echo $el_customer_row; ?>').attr('src', '<?php echo $no_image; ?>'); $('#input-image_el_customer<?php echo $el_customer_row; ?>').attr('value', '');"><?php echo $text_clear; ?></a></div>
                      </td>
                      <td><?php echo $entry_image_description; ?></td>
                      <td>
                        <input type="text" name="gixocaccount_el_customer[<?php echo $el_customer_row; ?>][image_width]" size="1" value="<?php echo $el['image_width']; ?>" class="form-control" />X
                        <input type="text" name="gixocaccount_el_customer[<?php echo $el_customer_row; ?>][image_height]" size="1" value="<?php echo $el['image_height']; ?>" class="form-control" />
                      </td>
                    </tr>

                    <tr>
                      <td><?php echo $entry_color; ?></td>
                      <td>
                        <input type="text" name="gixocaccount_el_customer[<?php echo $el_customer_row; ?>][color]" value="<?php echo $el['color']; ?>" id="input-color" size="6" class="color {required:false,hash:true} form-control" />
                     </td>
                      <td><?php echo $entry_color_hover; ?></td>
                      <td>
                        <input type="text" name="gixocaccount_el_customer[<?php echo $el_customer_row; ?>][color_hover]" value="<?php echo $el['color_hover']; ?>" id="input-color-hover"  size="6" class="color {required:false,hash:true} form-control" />
                     </td>
                    </tr>

                    <tr>
                      <td><?php echo $entry_font; ?></td>
                      <td>
                        <input type="text" name="gixocaccount_el_customer[<?php echo $el_customer_row; ?>][font]" size="1" value="<?php echo $el['font']; ?>" id="input-font" />px
                      </td>
                      <td><?php echo $entry_font_hover; ?><!-- <br><span class="help"><?php echo $help_info_font; ?></span> --></td>
                      <td>
                        <input type="text" name="gixocaccount_el_customer[<?php echo $el_customer_row; ?>][font_hover]" size="1" value="<?php echo $el['font_hover']; ?>" id="input-font-hover" />px
                      </td>
                    </tr>

                    <tr>
                      <td><?php echo $entry_status; ?></td>
                      <td>
                        <select name="gixocaccount_el_customer[<?php echo $el_customer_row; ?>][status]" id="input-status" class="form-control">
                        <?php if ($el['status']) { ?>
                          <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                          <option value="0"><?php echo $text_disabled; ?></option>
                        <?php } else { ?>
                          <option value="1"><?php echo $text_enabled; ?></option>
                          <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                        <?php } ?>
                        </select>
                      </td>
                      <td><?php echo $entry_sort_order; ?></td>
                      <td>
                        <input type="text" name="gixocaccount_el_customer[<?php echo $el_customer_row; ?>][sort_order]" size="1"  value="<?php echo $el['sort_order']; ?>" id="input-sort-order" />
                      </td>
                    </tr>
                  </table>
                </div>    
              <?php $el_customer_row++; ?>
              <?php } ?>
              <?php } ?>   
              </div>
            </div>
          </div>
        </div>
        <div id="tab-affiliate">
          <div class="content">
            <div class="vtabs">
              <a href="#tab-agroups"><?php echo $entry_groups; ?></a>
              <a href="#tab-agroup"><?php echo $entry_el; ?></a>           
            </div>
            <div id="tab-agroups" class="vtabs-content">
              <div class="buttons">
                <a onclick="addGroups_affiliate();" class="button"><img src="view/image/add.png" alt="<?php echo $button_groups_add; ?>" />&nbsp;<?php echo $button_groups_add; ?></a>  
              </div>
              <br />
              <div id="groups_affiliate">
              <?php $groups_affiliate_row = 0; ?>
              <?php if ($gixocaccount_groups_affiliate) { ?>
              <?php foreach ($gixocaccount_groups_affiliate as $groups) { ?>
                <div class="<?php if ($groups['status']) { ?>success<?php } else { ?>warning<?php } ?>" id="groups_affiliate-row<?php echo $groups_affiliate_row; ?>">
                  <div style="float:right;"  class="buttons">
                    <a onclick="confirm('<?php echo $text_confirm; ?>') ? $('#groups_affiliate-row<?php echo $groups_affiliate_row; ?>').remove() : false;" class="button" style="float: right;"><img src="view/image/delete.png" alt="<?php echo $button_delete; ?>" />&nbsp;<?php echo $button_delete; ?></a>  
                  </div>
                  <table class="form">
                    <input type="hidden" name="gixocaccount_groups_affiliate[<?php echo $groups_affiliate_row; ?>][id]" value="<?php echo $groups_affiliate_row; ?>" id="input-id_groups_affiliate<?php echo $groups_affiliate_row; ?>" />
                    <tr>
                      <td><?php echo $entry_name; ?></td>
                      <td>
                      <?php foreach ($languages as $language) { ?>
                        <input type="text" name="gixocaccount_groups_affiliate[<?php echo $groups_affiliate_row; ?>][name][<?php echo $language['language_id']; ?>]" value="<?php echo isset($groups['name'][$language['language_id']]) ? $groups['name'][$language['language_id']] : ''; ?>" class="form-control" /><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />
                        <?php if (isset($error_name[$language['language_id']])) { ?>
                        <div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>
                        <?php } ?>
                      <?php } ?>
                      </td>
                      <td><?php echo $entry_class_el; ?></td>
                      <td>
                        <input type="text" name="gixocaccount_groups_affiliate[<?php echo $groups_affiliate_row; ?>][class_el]" value="<?php echo $groups['class_el']; ?>" id="input-class-el" />
                      </td>
                    </tr>

                    <tr>
                      <td><?php echo $entry_color; ?></td>
                      <td>
                        <input type="text" name="gixocaccount_groups_affiliate[<?php echo $groups_affiliate_row; ?>][color]" value="<?php echo $groups['color']; ?>" id="input-color" size="6" class="color {required:false,hash:true} form-control" />
                     </td>
                      <td><?php echo $entry_color_hover; ?></td>
                      <td>
                        <input type="text" name="gixocaccount_groups_affiliate[<?php echo $groups_affiliate_row; ?>][color_hover]" value="<?php echo $groups['color_hover']; ?>" id="input-color-hover" size="6" class="color {required:false,hash:true} form-control" />
                     </td>
                    </tr>

                    <tr>
                      <td><?php echo $entry_font; ?></td>
                      <td>
                        <input type="text" name="gixocaccount_groups_affiliate[<?php echo $groups_affiliate_row; ?>][font]" size="1" value="<?php echo $groups['font']; ?>" id="input-font" />px
                      </td>
                      <td><?php echo $entry_font_hover; ?><!-- <br><span class="help"><?php echo $help_info_font; ?></span> --></td>
                      <td>
                        <input type="text" name="gixocaccount_groups_affiliate[<?php echo $groups_affiliate_row; ?>][font_hover]" size="1" value="<?php echo $groups['font_hover']; ?>" id="input-font-hover" />px
                      </td>
                    </tr>

                    <tr>
                      <td><?php echo $entry_status; ?></td>
                      <td>
                        <select name="gixocaccount_groups_affiliate[<?php echo $groups_affiliate_row; ?>][status]" id="input-status" class="form-control">
                        <?php if ($groups['status']) { ?>
                          <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                          <option value="0"><?php echo $text_disabled; ?></option>
                        <?php } else { ?>
                          <option value="1"><?php echo $text_enabled; ?></option>
                          <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                        <?php } ?>
                        </select>
                     </td>
                      <td><?php echo $entry_sort_order; ?></td>
                      <td>
                        <input type="text" name="gixocaccount_groups_affiliate[<?php echo $groups_affiliate_row; ?>][sort_order]" size="1"  value="<?php echo $groups['sort_order']; ?>" id="input-sort-order" />
                      </td>
                    </tr>
                  </table>
                </div>
              <?php $groups_affiliate_row++; ?>
              <?php } ?>
              <?php } ?>
                </div>
            </div>
            <div id="tab-agroup" class="vtabs-content">
              <div class="buttons">
                <a onclick="addEl_affiliate();" class="button"><img src="view/image/add.png" alt="<?php echo $button_el_add; ?>" />&nbsp;<?php echo $button_el_add; ?></a>  
              </div>
              <br />

              <div id="el_affiliate">
              <?php $el_affiliate_row = 0; ?>
              <?php if ($gixocaccount_el_affiliate) { ?>
              <?php foreach ($gixocaccount_el_affiliate as $el) { ?>
                <div class="<?php if ($el['status']) { ?>success<?php } else { ?>warning<?php } ?>" id="el_affiliate-row<?php echo $el_affiliate_row; ?>">
                  <div style="float:right;"  class="buttons">
                    <a onclick="confirm('<?php echo $text_confirm; ?>') ? $('#el_affiliate-row<?php echo $el_affiliate_row; ?>').remove() : false;" class="button" style="float: right;"><img src="view/image/delete.png" alt="<?php echo $button_delete; ?>" />&nbsp;<?php echo $button_delete; ?></a>  
                  </div>
                  <table class="form">
                    <input type="hidden" name="gixocaccount_el_affiliate[<?php echo $el_affiliate_row; ?>][id]" value="<?php echo $el_affiliate_row; ?>" id="input-id_el_affiliate<?php echo $el_affiliate_row; ?>" />
                    <tr>
                      <td><?php echo $entry_name; ?></td>
                      <td>
                      <?php foreach ($languages as $language) { ?>
                        <input type="text" name="gixocaccount_el_affiliate[<?php echo $el_affiliate_row; ?>][name][<?php echo $language['language_id']; ?>]" value="<?php echo isset($el['name'][$language['language_id']]) ? $el['name'][$language['language_id']] : ''; ?>"  class="form-control" /><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />
                        <?php if (isset($error_name[$language['language_id']])) { ?>
                        <div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>
                        <?php } ?>
                      <?php } ?>
                      </td>
                      <td><?php echo $entry_group; ?></td>
                      <td>
                        <select name="gixocaccount_el_affiliate[<?php echo $el_affiliate_row; ?>][affiliate_group_id]" id="input-gixocscd-group" class="form-control">
                          <?php foreach ($gixocaccount_groups_affiliate as $affiliate_group) { ?>
                            <?php if ($affiliate_group['id'] == $el['affiliate_group_id']) { ?>
                            <option value="<?php echo $affiliate_group['id']; ?>" selected="selected"><?php echo $affiliate_group['name'][$language_id]; ?></option>
                            <?php } else { ?>
                            <option value="<?php echo $affiliate_group['id']; ?>"><?php echo $affiliate_group['name'][$language_id]; ?></option>
                            <?php } ?>
                          <?php } ?>
                        </select>
                      </td>
                    </tr>

                    <tr>
                      <td><?php echo $entry_class_el; ?></td>
                      <td>
                        <input type="text" name="gixocaccount_el_affiliate[<?php echo $el_affiliate_row; ?>][class_el]" value="<?php echo $el['class_el']; ?>" id="input-class-el" />
                      </td>
                      <td><?php echo $entry_url; ?></td>
                      <td>
                        <?php echo $domain; ?><input type="text" name="gixocaccount_el_affiliate[<?php echo $el_affiliate_row; ?>][url]" value="<?php echo $el['url']; ?>" id="input-url" class="form-control" />
                      </td>
                    </tr>

                    <tr>
                      <td><?php echo $entry_image; ?></td>
                      <td>
                        <div class="image">
                          <img src="<?php echo $el['thumb']; ?>" alt="" id="thumb-image_el_affiliate<?php echo $el_affiliate_row; ?>" />
                          <input type="hidden" name="gixocaccount_el_affiliate[<?php echo $el_affiliate_row; ?>][image]" value="<?php echo $el['image']; ?>" id="input-image_el_affiliate<?php echo $el_affiliate_row; ?>" />
                          <br />
                          <a onclick="image_upload('input-image_el_affiliate<?php echo $el_affiliate_row; ?>', 'thumb-image_el_affiliate<?php echo $el_affiliate_row; ?>');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb-image_el_affiliate<?php echo $el_affiliate_row; ?>').attr('src', '<?php echo $no_image; ?>'); $('#input-image_el_affiliate<?php echo $el_affiliate_row; ?>').attr('value', '');"><?php echo $text_clear; ?></a></div>
                      </td>
                      <td><?php echo $entry_image_description; ?></td>
                      <td>
                        <input type="text" name="gixocaccount_el_affiliate[<?php echo $el_affiliate_row; ?>][image_width]" size="1" value="<?php echo $el['image_width']; ?>" class="form-control" />X
                        <input type="text" name="gixocaccount_el_affiliate[<?php echo $el_affiliate_row; ?>][image_height]" size="1" value="<?php echo $el['image_height']; ?>" class="form-control" />
                      </td>
                    </tr>

                    <tr>
                      <td><?php echo $entry_color; ?></td>
                      <td>
                        <input type="text" name="gixocaccount_el_affiliate[<?php echo $el_affiliate_row; ?>][color]" value="<?php echo $el['color']; ?>" id="input-color" size="6" class="color {required:false,hash:true} form-control" />
                     </td>
                      <td><?php echo $entry_color_hover; ?></td>
                      <td>
                        <input type="text" name="gixocaccount_el_affiliate[<?php echo $el_affiliate_row; ?>][color_hover]" value="<?php echo $el['color_hover']; ?>" id="input-color-hover"  size="6" class="color {required:false,hash:true} form-control" />
                     </td>
                    </tr>

                    <tr>
                      <td><?php echo $entry_font; ?></td>
                      <td>
                        <input type="text" name="gixocaccount_el_affiliate[<?php echo $el_affiliate_row; ?>][font]" size="1" value="<?php echo $el['font']; ?>" id="input-font" />px
                      </td>
                      <td><?php echo $entry_font_hover; ?><!-- <br><span class="help"><?php echo $help_info_font; ?></span> --></td>
                      <td>
                        <input type="text" name="gixocaccount_el_affiliate[<?php echo $el_affiliate_row; ?>][font_hover]" size="1" value="<?php echo $el['font_hover']; ?>" id="input-font-hover" />px
                      </td>
                    </tr>

                    <tr>
                      <td><?php echo $entry_status; ?></td>
                      <td>
                        <select name="gixocaccount_el_affiliate[<?php echo $el_affiliate_row; ?>][status]" id="input-status" class="form-control">
                        <?php if ($el['status']) { ?>
                          <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                          <option value="0"><?php echo $text_disabled; ?></option>
                        <?php } else { ?>
                          <option value="1"><?php echo $text_enabled; ?></option>
                          <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                        <?php } ?>
                        </select>
                      </td>
                      <td><?php echo $entry_sort_order; ?></td>
                      <td>
                        <input type="text" name="gixocaccount_el_affiliate[<?php echo $el_affiliate_row; ?>][sort_order]" size="1"  value="<?php echo $el['sort_order']; ?>" id="input-sort-order" />
                      </td>
                    </tr>
                  </table>
                </div>    
              <?php $el_affiliate_row++; ?>
              <?php } ?>
              <?php } ?>   
              </div>
            </div>
          </div>
        </div>
    </form>
  </div>
  </div>
</div>
<script type="text/javascript" src="view/javascript/jscolor/jscolor.js"></script>
<script type="text/javascript"><!--
function image_upload(field, thumb) {
	$('#dialog').remove();
	
	$('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');
	
	$('#dialog').dialog({
		title: '<?php echo $text_image_manager; ?>',
		close: function (event, ui) {
			if ($('#' + field).attr('value')) {
				$.ajax({
					url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).attr('value')),
					dataType: 'text',
					success: function(text) {
						$('#' + thumb).replaceWith('<img src="' + text + '" alt="" id="' + thumb + '" />');
					}
				});
			}
		},	
		bgiframe: false,
		width: 800,
		height: 400,
		resizable: false,
		modal: false
	});
};
//--></script> 
<script type="text/javascript"><!--
$('#tabs a').tabs();
//--></script>
<script type="text/javascript"><!--
$('.vtabs a').tabs();
//--></script>
<script type="text/javascript"><!--
<?php if (empty($gixocaccount_groups_customer)) { ?>
$(document).ready(function() {
    addGroups_customer();
});
<?php } ?>

<?php if (empty($gixocaccount_el_customer)) { ?>
$(document).ready(function() {
    addEl_customer();
});
<?php } ?>

<?php if (empty($gixocaccount_groups_affiliate)) { ?>
$(document).ready(function() {
    addGroups_affiliate();
});
<?php } ?>

<?php if (empty($gixocaccount_el_affiliate)) { ?>
$(document).ready(function() {
    addEl_affiliate();
});
<?php } ?>

var groups_customer_row = <?php echo $groups_customer_row; ?>;

function addGroups_customer() {
html = '	                <div class="<?php if ($groups['status']) { ?>success<?php } else { ?>warning<?php } ?>" id="groups_customer-row' + groups_customer_row + '">';
html += '                  <div style="float:right;"  class="buttons">';
html += '                    <a onclick="confirm(\'<?php echo $text_confirm; ?>\') ? $(\'#groups_customer-row' + groups_customer_row + '\').remove() : false;" class="button" style="float: right;"><img src="view/image/delete.png" alt="<?php echo $button_delete; ?>" />&nbsp;<?php echo $button_delete; ?></a>  ';
html += '                  </div>';
html += '                  <table class="form">';
html += '                    <input type="hidden" name="gixocaccount_groups_customer[' + groups_customer_row + '][id]" value="' + groups_customer_row + '" id="input-id_groups_customer' + groups_customer_row + '" />';
html += '                    <tr>';
html += '                      <td><?php echo $entry_name; ?></td>';
html += '                      <td>';
html += '                      <?php foreach ($languages as $language) { ?>';
html += '                        <input type="text" name="gixocaccount_groups_customer[' + groups_customer_row + '][name][<?php echo $language['language_id']; ?>]" value="<?php echo $entry_name; ?>" class="form-control" /><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />';
html += '                        <?php if (isset($error_name[$language['language_id']])) { ?>';
html += '                        <div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>';
html += '                        <?php } ?>';
html += '                      <?php } ?>';
html += '                      </td>';
html += '                      <td><?php echo $entry_class_el; ?></td>';
html += '                      <td>';
html += '                        <input type="text" name="gixocaccount_groups_customer[' + groups_customer_row + '][class_el]" value="h2" id="input-class-el" />';
html += '                      </td>';
html += '                   </tr>';
html += '                    <tr>';
html += '                      <td><?php echo $entry_color; ?></td>';
html += '                      <td>';
html += '                        <input type="text" name="gixocaccount_groups_customer[' + groups_customer_row + '][color]" value="#000000" id="input-color" size="6" class="color {required:false,hash:true} form-control" />';
html += '                      </td>';
html += '                      <td><?php echo $entry_color_hover; ?></td>';
html += '                      <td>';
html += '                        <input type="text" name="gixocaccount_groups_customer[' + groups_customer_row + '][color_hover]" value="#000000" id="input-color-hover"  size="6" class="color {required:false,hash:true} form-control" />';
html += '                     </td>';
html += '                    </tr>';
html += '                    <tr>';
html += '                      <td><?php echo $entry_font; ?></td>';
html += '                      <td>';
html += '                        <input type="text" name="gixocaccount_groups_customer[' + groups_customer_row + '][font]" size="1" value="27" id="input-font" />px';
html += '                      </td>';
html += '                      <td><?php echo $entry_font_hover; ?><!-- <br><span class="help"><?php echo $help_info_font; ?></span> --></td>';
html += '                      <td>';
html += '                        <input type="text" name="gixocaccount_groups_customer[' + groups_customer_row + '][font_hover]" size="1" value="28" id="input-font-hover" />px';
html += '                      </td>';
html += '                    </tr>';
html += '                    <tr>';
html += '                      <td><?php echo $entry_status; ?></td>';
html += '                      <td>';
html += '                        <select name="gixocaccount_groups_customer[' + groups_customer_row + '][status]" id="input-status" class="form-control">';
html += '                          <option value="1"><?php echo $text_enabled; ?></option>';
html += '                          <option value="0" selected="selected"><?php echo $text_disabled; ?></option>';
html += '                        </select>';
html += '                      </td>';
html += '                      <td><?php echo $entry_sort_order; ?></td>';
html += '                      <td>';
html += '                        <input type="text" name="gixocaccount_groups_customer[' + groups_customer_row + '][sort_order]" size="1"  value="" id="input-sort-order" />';
html += '                      </td>';
html += '                    </tr>';
html += '                  </table>';
html += '                </div>';

    $('#groups_customer').append(html);
    $([document.documentElement, document.body]).animate({
        scrollTop: $('#groups_customer-row' + groups_customer_row).offset().top
    }, 2000);
    groups_customer_row++;
}

var el_customer_row = <?php echo $el_customer_row; ?>;

function addEl_customer() {
html = '                <div class="<?php if ($el['status']) { ?>success<?php } else { ?>warning<?php } ?>" id="el_customer-row' + el_customer_row + '">';
html += '                  <div style="float:right;"  class="buttons">';
html += '                    <a onclick="confirm(\'<?php echo $text_confirm; ?>\') ? $(\'#el_customer-row' + el_customer_row + '\').remove() : false;" class="button" style="float: right;"><img src="view/image/delete.png" alt="<?php echo $button_delete; ?>" />&nbsp;<?php echo $button_delete; ?></a>  ';
html += '                  </div>';
html += '                  <table class="form">';
html += '                    <input type="hidden" name="gixocaccount_el_customer[' + el_customer_row + '][id]" value="' + el_customer_row + '" id="input-id_el_customer' + el_customer_row + '" />';
html += '                    <tr>';
html += '                      <td><?php echo $entry_name; ?></td>';
html += '                      <td>';
html += '                      <?php foreach ($languages as $language) { ?>';
html += '                        <input type="text" name="gixocaccount_el_customer[' + el_customer_row + '][name][<?php echo $language['language_id']; ?>]" value="" class="form-control" /><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />';
html += '                        <?php if (isset($error_name[$language['language_id']])) { ?>';
html += '                        <div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>';
html += '                        <?php } ?>';
html += '                      <?php } ?>';
html += '                      </td>';
html += '                      <td><?php echo $entry_group; ?></td>';
html += '                      <td>';
html += '                        <select name="gixocaccount_el_customer[' + el_customer_row + '][customer_group_id]" id="input-gixocscd-group" class="form-control">';
html += '                          <?php foreach ($gixocaccount_groups_customer as $customer_group) { ?>';
html += '                            <option value="<?php echo $customer_group['id']; ?>"><?php echo $customer_group['name'][$language_id]; ?></option>';
html += '                          <?php } ?>';
html += '                        </select>';
html += '                      </td>';
html += '                    </tr>';
html += '                    <tr>';
html += '                      <td><?php echo $entry_class_el; ?></td>';
html += '                      <td>';
html += '                        <input type="text" name="gixocaccount_el_customer[' + el_customer_row + '][class_el]" value="" id="input-class-el" />';
html += '                      </td>';
html += '                      <td><?php echo $entry_url; ?></td>';
html += '                      <td>';
html += '                        <?php echo $domain; ?><input type="text" name="gixocaccount_el_customer[' + el_customer_row + '][url]" value="" id="input-url" class="form-control" />';
html += '                      </td>';
html += '                    </tr>';
html += '                    <tr>';
html += '                      <td><?php echo $entry_image; ?></td>';
html += '                      <td>';
html += '                        <div class="image">';
html += '                          <img src="<?php echo $no_image; ?>" alt="" id="thumb-image_el_customer' + el_customer_row + '" />';
html += '                          <input type="hidden" name="gixocaccount_el_customer[' + el_customer_row + '][image]" value="" id="input-image_el_customer' + el_customer_row + '" />';
html += '                          <br />';
html += '                          <a onclick="image_upload(\'input-image_el_customer' + el_customer_row + '\', \'thumb-image_el_customer' + el_customer_row + '\');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$(\'#thumb-image_el_customer' + el_customer_row + '\').attr(\'src\', \'<?php echo $no_image; ?>\'); $(\'#input-image_el_customer' + el_customer_row + '\').attr(\'value\', \'\');"><?php echo $text_clear; ?></a></div>';
html += '                      </td>';
html += '                      <td><?php echo $entry_image_description; ?></td>';
html += '                      <td>';
html += '                        <input type="text" name="gixocaccount_el_customer[' + el_customer_row + '][image_width]" size="1" value="<?php echo $el['image_width']; ?>" class="form-control" />X';
html += '                        <input type="text" name="gixocaccount_el_customer[' + el_customer_row + '][image_height]" size="1" value="<?php echo $el['image_height']; ?>" class="form-control" />';
html += '                      </td>';
html += '                    </tr>';
html += '                    <tr>';
html += '                      <td><?php echo $entry_color; ?></td>';
html += '                      <td>';
html += '                        <input type="text" name="gixocaccount_el_customer[' + el_customer_row + '][color]" value="#000000" id="input-color" size="6" class="color {required:false,hash:true} form-control" />';
html += '                     </td>';
html += '                      <td><?php echo $entry_color_hover; ?></td>';
html += '                      <td>';
html += '                        <input type="text" name="gixocaccount_el_customer[' + el_customer_row + '][color_hover]" value="#000000" id="input-color-hover"  size="6" class="color {required:false,hash:true} form-control" />';
html += '                     </td>';
html += '                    </tr>';
html += '                    <tr>';
html += '                      <td><?php echo $entry_font; ?></td>';
html += '                      <td>';
html += '                        <input type="text" name="gixocaccount_el_customer[' + el_customer_row + '][font]" size="1" value="14" id="input-font" />px';
html += '                      </td>';
html += '                      <td><?php echo $entry_font_hover; ?><!-- <br><span class="help"><?php echo $help_info_font; ?></span> --></td>';
html += '                      <td>';
html += '                        <input type="text" name="gixocaccount_el_customer[' + el_customer_row + '][font_hover]" size="1" value="15" id="input-font-hover" />px';
html += '                      </td>';
html += '                    </tr>';
html += '                    <tr>';
html += '                      <td><?php echo $entry_status; ?></td>';
html += '                      <td>';
html += '                        <select name="gixocaccount_el_customer[' + el_customer_row + '][status]" id="input-status" class="form-control">';
html += '                          <option value="1"><?php echo $text_enabled; ?></option>';
html += '                          <option value="0" selected="selected"><?php echo $text_disabled; ?></option>';
html += '                        </select>';
html += '                      </td>';
html += '                      <td><?php echo $entry_sort_order; ?></td>';
html += '                      <td>';
html += '                        <input type="text" name="gixocaccount_el_customer[' + el_customer_row + '][sort_order]" size="1"  value="" id="input-sort-order" />';
html += '                      </td>';
html += '                    </tr>';
html += '                  </table>';
html += '                </div>    ';

    $('#el_customer').append(html);
    $([document.documentElement, document.body]).animate({
        scrollTop: $('#el_customer-row' + el_customer_row).offset().top
    }, 2000);
    el_customer_row++;
}

var groups_affiliate_row = <?php echo $groups_affiliate_row; ?>;

function addGroups_affiliate() {
html = '	                <div class="<?php if ($groups['status']) { ?>success<?php } else { ?>warning<?php } ?>" id="groups_affiliate-row' + groups_affiliate_row + '">';
html += '                  <div style="float:right;"  class="buttons">';
html += '                    <a onclick="confirm(\'<?php echo $text_confirm; ?>\') ? $(\'#groups_affiliate-row' + groups_affiliate_row + '\').remove() : false;" class="button" style="float: right;"><img src="view/image/delete.png" alt="<?php echo $button_delete; ?>" />&nbsp;<?php echo $button_delete; ?></a>  ';
html += '                  </div>';
html += '                  <table class="form">';
html += '                    <input type="hidden" name="gixocaccount_groups_affiliate[' + groups_affiliate_row + '][id]" value="' + groups_affiliate_row + '" id="input-id_groups_affiliate' + groups_affiliate_row + '" />';
html += '                    <tr>';
html += '                      <td><?php echo $entry_name; ?></td>';
html += '                      <td>';
html += '                      <?php foreach ($languages as $language) { ?>';
html += '                        <input type="text" name="gixocaccount_groups_affiliate[' + groups_affiliate_row + '][name][<?php echo $language['language_id']; ?>]" value="<?php echo $entry_name; ?>" class="form-control" /><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />';
html += '                        <?php if (isset($error_name[$language['language_id']])) { ?>';
html += '                        <div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>';
html += '                        <?php } ?>';
html += '                      <?php } ?>';
html += '                      </td>';
html += '                      <td><?php echo $entry_class_el; ?></td>';
html += '                      <td>';
html += '                        <input type="text" name="gixocaccount_groups_affiliate[' + groups_affiliate_row + '][class_el]" value="h2" id="input-class-el" />';
html += '                      </td>';
html += '                   </tr>';
html += '                    <tr>';
html += '                      <td><?php echo $entry_color; ?></td>';
html += '                      <td>';
html += '                        <input type="text" name="gixocaccount_groups_affiliate[' + groups_affiliate_row + '][color]" value="#000000" id="input-color" size="6" class="color {required:false,hash:true} form-control" />';
html += '                      </td>';
html += '                      <td><?php echo $entry_color_hover; ?></td>';
html += '                      <td>';
html += '                        <input type="text" name="gixocaccount_groups_affiliate[' + groups_affiliate_row + '][color_hover]" value="#000000" id="input-color-hover"  size="6" class="color {required:false,hash:true} form-control" />';
html += '                     </td>';
html += '                    </tr>';
html += '                    <tr>';
html += '                      <td><?php echo $entry_font; ?></td>';
html += '                      <td>';
html += '                        <input type="text" name="gixocaccount_groups_affiliate[' + groups_affiliate_row + '][font]" size="1" value="27" id="input-font" />px';
html += '                      </td>';
html += '                      <td><?php echo $entry_font_hover; ?><!-- <br><span class="help"><?php echo $help_info_font; ?></span> --></td>';
html += '                      <td>';
html += '                        <input type="text" name="gixocaccount_groups_affiliate[' + groups_affiliate_row + '][font_hover]" size="1" value="28" id="input-font-hover" />px';
html += '                      </td>';
html += '                    </tr>';
html += '                    <tr>';
html += '                      <td><?php echo $entry_status; ?></td>';
html += '                      <td>';
html += '                        <select name="gixocaccount_groups_affiliate[' + groups_affiliate_row + '][status]" id="input-status" class="form-control">';
html += '                          <option value="1"><?php echo $text_enabled; ?></option>';
html += '                          <option value="0" selected="selected"><?php echo $text_disabled; ?></option>';
html += '                        </select>';
html += '                      </td>';
html += '                      <td><?php echo $entry_sort_order; ?></td>';
html += '                      <td>';
html += '                        <input type="text" name="gixocaccount_groups_affiliate[' + groups_affiliate_row + '][sort_order]" size="1"  value="" id="input-sort-order" />';
html += '                      </td>';
html += '                    </tr>';
html += '                  </table>';
html += '                </div>';

    $('#groups_affiliate').append(html);
    $([document.documentElement, document.body]).animate({
        scrollTop: $('#groups_affiliate-row' + groups_affiliate_row).offset().top
    }, 2000);
    groups_affiliate_row++;
}

var el_affiliate_row = <?php echo $el_affiliate_row; ?>;

function addEl_affiliate() {
html = '                <div class="<?php if ($el['status']) { ?>success<?php } else { ?>warning<?php } ?>" id="el_affiliate-row' + el_affiliate_row + '">';
html += '                  <div style="float:right;"  class="buttons">';
html += '                    <a onclick="confirm(\'<?php echo $text_confirm; ?>\') ? $(\'#el_affiliate-row' + el_affiliate_row + '\').remove() : false;" class="button" style="float: right;"><img src="view/image/delete.png" alt="<?php echo $button_delete; ?>" />&nbsp;<?php echo $button_delete; ?></a>  ';
html += '                  </div>';
html += '                  <table class="form">';
html += '                    <input type="hidden" name="gixocaccount_el_affiliate[' + el_affiliate_row + '][id]" value="' + el_affiliate_row + '" id="input-id_el_affiliate' + el_affiliate_row + '" />';
html += '                    <tr>';
html += '                      <td><?php echo $entry_name; ?></td>';
html += '                      <td>';
html += '                      <?php foreach ($languages as $language) { ?>';
html += '                        <input type="text" name="gixocaccount_el_affiliate[' + el_affiliate_row + '][name][<?php echo $language['language_id']; ?>]" value="" class="form-control" /><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />';
html += '                        <?php if (isset($error_name[$language['language_id']])) { ?>';
html += '                        <div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>';
html += '                        <?php } ?>';
html += '                      <?php } ?>';
html += '                      </td>';
html += '                      <td><?php echo $entry_group; ?></td>';
html += '                      <td>';
html += '                        <select name="gixocaccount_el_affiliate[' + el_affiliate_row + '][affiliate_group_id]" id="input-gixocscd-group" class="form-control">';
html += '                          <?php foreach ($gixocaccount_groups_affiliate as $affiliate_group) { ?>';
html += '                            <option value="<?php echo $affiliate_group['id']; ?>"><?php echo $affiliate_group['name'][$language_id]; ?></option>';
html += '                          <?php } ?>';
html += '                        </select>';
html += '                      </td>';
html += '                    </tr>';
html += '                    <tr>';
html += '                      <td><?php echo $entry_class_el; ?></td>';
html += '                      <td>';
html += '                        <input type="text" name="gixocaccount_el_affiliate[' + el_affiliate_row + '][class_el]" value="" id="input-class-el" />';
html += '                      </td>';
html += '                      <td><?php echo $entry_url; ?></td>';
html += '                      <td>';
html += '                        <?php echo $domain; ?><input type="text" name="gixocaccount_el_affiliate[' + el_affiliate_row + '][url]" value="" id="input-url" class="form-control" />';
html += '                      </td>';
html += '                    </tr>';
html += '                    <tr>';
html += '                      <td><?php echo $entry_image; ?></td>';
html += '                      <td>';
html += '                        <div class="image">';
html += '                          <img src="<?php echo $no_image; ?>" alt="" id="thumb-image_el_affiliate' + el_affiliate_row + '" />';
html += '                          <input type="hidden" name="gixocaccount_el_affiliate[' + el_affiliate_row + '][image]" value="" id="input-image_el_affiliate' + el_affiliate_row + '" />';
html += '                          <br />';
html += '                          <a onclick="image_upload(\'input-image_el_affiliate' + el_affiliate_row + '\', \'thumb-image_el_affiliate' + el_affiliate_row + '\');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$(\'#thumb-image_el_affiliate' + el_affiliate_row + '\').attr(\'src\', \'<?php echo $no_image; ?>\'); $(\'#input-image_el_affiliate' + el_affiliate_row + '\').attr(\'value\', \'\');"><?php echo $text_clear; ?></a></div>';
html += '                      </td>';
html += '                      <td><?php echo $entry_image_description; ?></td>';
html += '                      <td>';
html += '                        <input type="text" name="gixocaccount_el_affiliate[' + el_affiliate_row + '][image_width]" size="1" value="<?php echo $el['image_width']; ?>" class="form-control" />X';
html += '                        <input type="text" name="gixocaccount_el_affiliate[' + el_affiliate_row + '][image_height]" size="1" value="<?php echo $el['image_height']; ?>" class="form-control" />';
html += '                      </td>';
html += '                    </tr>';
html += '                    <tr>';
html += '                      <td><?php echo $entry_color; ?></td>';
html += '                      <td>';
html += '                        <input type="text" name="gixocaccount_el_affiliate[' + el_affiliate_row + '][color]" value="#000000" id="input-color" size="6" class="color {required:false,hash:true} form-control" />';
html += '                     </td>';
html += '                      <td><?php echo $entry_color_hover; ?></td>';
html += '                      <td>';
html += '                        <input type="text" name="gixocaccount_el_affiliate[' + el_affiliate_row + '][color_hover]" value="#000000" id="input-color-hover"  size="6" class="color {required:false,hash:true} form-control" />';
html += '                     </td>';
html += '                    </tr>';
html += '                    <tr>';
html += '                      <td><?php echo $entry_font; ?></td>';
html += '                      <td>';
html += '                        <input type="text" name="gixocaccount_el_affiliate[' + el_affiliate_row + '][font]" size="1" value="14" id="input-font" />px';
html += '                      </td>';
html += '                      <td><?php echo $entry_font_hover; ?><!-- <br><span class="help"><?php echo $help_info_font; ?></span> --></td>';
html += '                      <td>';
html += '                        <input type="text" name="gixocaccount_el_affiliate[' + el_affiliate_row + '][font_hover]" size="1" value="15" id="input-font-hover" />px';
html += '                      </td>';
html += '                    </tr>';
html += '                    <tr>';
html += '                      <td><?php echo $entry_status; ?></td>';
html += '                      <td>';
html += '                        <select name="gixocaccount_el_affiliate[' + el_affiliate_row + '][status]" id="input-status" class="form-control">';
html += '                          <option value="1"><?php echo $text_enabled; ?></option>';
html += '                          <option value="0" selected="selected"><?php echo $text_disabled; ?></option>';
html += '                        </select>';
html += '                      </td>';
html += '                      <td><?php echo $entry_sort_order; ?></td>';
html += '                      <td>';
html += '                        <input type="text" name="gixocaccount_el_affiliate[' + el_affiliate_row + '][sort_order]" size="1"  value="" id="input-sort-order" />';
html += '                      </td>';
html += '                    </tr>';
html += '                  </table>';
html += '                </div>    ';

    $('#el_affiliate').append(html);
    $([document.documentElement, document.body]).animate({
        scrollTop: $('#el_affiliate-row' + el_affiliate_row).offset().top
    }, 2000);
    el_affiliate_row++;
}
//--></script
<?php echo $footer; ?>