<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-gixocaccount" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
      </div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
      <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
      <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
  <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
  <?php } ?>
  <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check"></i> <?php echo $success; ?>
        <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
  <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-gixocaccount" class="form-horizontal">
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-design" data-toggle="tab"><i class="fa fa-cog"></i> <?php echo $tab_design;?></a></li>
            <li><a href="#tab-customer" data-toggle="tab"><i class="fa fa-user"></i> <?php echo $tab_customer;?></a></li>
            <li><a href="#tab-affiliate" data-toggle="tab"><i class="fa fa-share-alt"></i> <?php echo $tab_affiliate;?></a></li>
            <li><a href="#tab-module_customer" data-toggle="tab"><i class="fa fa-user"></i> <?php echo $tab_module_customer;?></a></li>
            <li><a href="#tab-module_affiliate" data-toggle="tab"><i class="fa fa-share-alt"></i> <?php echo $tab_module_affiliate;?></a></li>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="tab-design">
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_status; ?></label>
                <div class="col-sm-10">
                  <select name="gixocaccount_status" id="input-status" class="form-control">
                  <?php if ($gixocaccount_status) { ?> 
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_info_css; ?>"><?php echo $entry_css; ?></span></label>
                <div class="col-sm-10">
                  <textarea name="gixocaccount_css" rows="5" placeholder="<?php echo $text_css; ?>" class="form-control"><?php echo $gixocaccount_css; ?></textarea>
                </div>
              </div>
              <fieldset>
                <legend><?php echo $text_other; ?></legend>
				<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $text_test; ?></div>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_info_back; ?>"><?php echo $entry_back; ?></span></label>
                  <div class="col-sm-10">
                    <label class="radio-inline">
                      <?php if ($gixocaccount_back) { ?>
                      <input type="radio" name="gixocaccount_back" value="1" checked="checked" />
                      <?php echo $text_yes; ?>
                      <?php } else { ?>
                      <input type="radio" name="gixocaccount_back" value="1" />
                      <?php echo $text_yes; ?>
                      <?php } ?>
                    </label>
                    <label class="radio-inline">
                      <?php if (!$gixocaccount_back) { ?>
                      <input type="radio" name="gixocaccount_back" value="0" checked="checked" />
                      <?php echo $text_no; ?>
                      <?php } else { ?>
                      <input type="radio" name="gixocaccount_back" value="0" />
                      <?php echo $text_no; ?>
                      <?php } ?>
                    </label>
                  </div>
                </div>
              </fieldset>
            </div>
            <div class="tab-pane" id="tab-customer">
              <div class="row">
                <div class="col-sm-2">
                    <ul class="nav nav-pills nav-stacked" id="tab-design">
                        <li class="active"><a href="#tab-groups_customer" data-toggle="tab"><?php echo $entry_groups; ?></a></li>
                        <li><a href="#tab-el_customer" data-toggle="tab"><?php echo $entry_el; ?></a></li>
                    </ul>
                </div>
                <div class="col-sm-10">
                   <div class="tab-content">
                      <div class="tab-pane active" id="tab-groups_customer">
                        <div class="row">
                          <div class="form-group">
                            <div class="pull-right col-sm-3">
                              <button type="button" onclick="addGroups_customer();" data-toggle="tooltip" class="btn btn-primary"><i class="fa fa-plus-circle"></i> <?php echo $button_groups_add; ?></button>
                            </div>
                          </div>
                        </div>
                        <div id="groups_customer">
                        <?php $groups_customer_row = 0; ?>
                        <?php if ($gixocaccount_groups_customer) { ?>
                        <?php foreach ($gixocaccount_groups_customer as $groups) { ?>
                         <div class="well" id="groups_customer-row<?php echo $groups_customer_row; ?>">
                          <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger pull-right" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#groups_customer-row<?php echo $groups_customer_row; ?>').remove() : false;"><i class="fa fa-trash-o"></i></button>
                          <input type="hidden" name="gixocaccount_groups_customer[<?php echo $groups_customer_row; ?>][id]" value="<?php echo $groups_customer_row; ?>" id="input-id_groups_customer<?php echo $groups_customer_row; ?>" />
                          <div class="form-group">
                            <div class="row">
                              <label class="col-sm-2 control-label"><?php echo $entry_name; ?></label>
                              <div class="col-sm-9">
                                <?php foreach ($languages as $language) { ?>
                                <div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                                  <input type="text" name="gixocaccount_groups_customer[<?php echo $groups_customer_row; ?>][name][<?php echo $language['language_id']; ?>]" value="<?php echo isset($groups['name'][$language['language_id']]) ? $groups['name'][$language['language_id']] : ''; ?>" placeholder="<?php echo $entry_name; ?>" class="form-control" />
                                </div>
                                <?php if (isset($error_name[$language['language_id']])) { ?>
                                <div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>
                                <?php } ?>
                                <?php } ?>
                              </div>
                            </div>
                          </div>

                          <div class="form-group">
                            <div class="row">
                              <label class="col-sm-2 control-label"><?php echo $entry_class_el; ?></label>
                              <div class="col-sm-9">
                                <input type="text" name="gixocaccount_groups_customer[<?php echo $groups_customer_row; ?>][class_el]" value="<?php echo $groups['class_el']; ?>" placeholder="<?php echo $entry_class_el; ?>" id="input-class-el" class="form-control" />
                              </div>
                            </div>
                          </div>
                          
                          <div class="form-group">
                            <div class="row">
                              <label class="col-sm-2 control-label"><?php echo $entry_sort_order; ?></label>
                              <div class="col-sm-1">
                                <input type="text" name="gixocaccount_groups_customer[<?php echo $groups_customer_row; ?>][sort_order]" value="<?php echo $groups['sort_order']; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />
                              </div>                              
                              <label class="col-sm-2 control-label"><?php echo $entry_color; ?></label>
                              <div class="col-sm-2">
                                <input type="text" name="gixocaccount_groups_customer[<?php echo $groups_customer_row; ?>][color]" value="<?php echo $groups['color']; ?>" placeholder="<?php echo $entry_color; ?>" id="input-color" size="6" class="color {required:false,hash:true} form-control" />
                              </div>
                              <label class="col-sm-2 control-label"><?php echo $entry_color_hover; ?></label>
                              <div class="col-sm-2">
                                <input type="text" name="gixocaccount_groups_customer[<?php echo $groups_customer_row; ?>][color_hover]" value="<?php echo $groups['color_hover']; ?>" placeholder="<?php echo $entry_color_hover; ?>" id="input-color-hover"  size="6" class="color {required:false,hash:true} form-control" />
                              </div>
                            </div>
                          </div>
                          
                          <div class="form-group">
                            <div class="row">
                              <label class="col-sm-2 control-label"><?php echo $entry_status; ?></label>
                              <div class="col-sm-2">
                                <select name="gixocaccount_groups_customer[<?php echo $groups_customer_row; ?>][status]" id="input-status" class="form-control">
                                <?php if ($groups['status']) { ?>
                                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                  <option value="0"><?php echo $text_disabled; ?></option>
                                <?php } else { ?>
                                  <option value="1"><?php echo $text_enabled; ?></option>
                                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                <?php } ?>
                                </select>
                              </div>
                              <label class="col-sm-1 control-label"><?php echo $entry_font; ?></label>
                              <div class="col-sm-2">
                                <div class="input-group">
                                  <input type="text" name="gixocaccount_groups_customer[<?php echo $groups_customer_row; ?>][font]" value="<?php echo $groups['font']; ?>" placeholder="<?php echo $entry_font; ?>" id="input-font" class="form-control" />
                                  <span class="input-group-addon">px</span>
                                </div>
                              </div>
                              <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_info_font; ?>"><?php echo $entry_font_hover; ?></span></label>
                              <div class="col-sm-2">
                                <div class="input-group">
                                  <input type="text" name="gixocaccount_groups_customer[<?php echo $groups_customer_row; ?>][font_hover]" value="<?php echo $groups['font_hover']; ?>" placeholder="<?php echo $entry_font_hover; ?>" id="input-font-hover" class="form-control" />
                                  <span class="input-group-addon">px</span>
                                </div>
                              </div>
                            </div>
                          </div>
                         </div>    
                        <?php $groups_customer_row++; ?>
                        <?php } ?>
                        <?php } ?>   
                        </div>
                      </div>
                      <div class="tab-pane" id="tab-el_customer">
                        <div class="row">
                          <div class="form-group">
                            <div class="pull-right col-sm-3">
                              <button type="button" onclick="addEl_customer();" data-toggle="tooltip" class="btn btn-primary"><i class="fa fa-plus-circle"></i> <?php echo $button_el_add; ?></button>
                            </div>
                          </div>
                        </div>
                        <div id="el_customer">
                        <?php $el_customer_row = 0; ?>
                        <?php if ($gixocaccount_el_customer) { ?>
                        <?php foreach ($gixocaccount_el_customer as $el) { ?>
                         <div class="well" id="el_customer-row<?php echo $el_customer_row; ?>">
                          <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger pull-right" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#el_customer-row<?php echo $el_customer_row; ?>').remove() : false;"><i class="fa fa-trash-o"></i></button>
                          <input type="hidden" name="gixocaccount_el_customer[<?php echo $el_customer_row; ?>][id]" value="<?php echo $el_customer_row; ?>" id="input-id_el_customer<?php echo $el_customer_row; ?>" />
                          <div class="form-group">
                            <div class="row">
                              <label class="col-sm-2 control-label"><?php echo $entry_name; ?></label>
                              <div class="col-sm-9">
                                <?php foreach ($languages as $language) { ?>
                                <div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                                  <input type="text" name="gixocaccount_el_customer[<?php echo $el_customer_row; ?>][name][<?php echo $language['language_id']; ?>]" value="<?php echo isset($el['name'][$language['language_id']]) ? $el['name'][$language['language_id']] : ''; ?>" placeholder="<?php echo $entry_name; ?>" class="form-control" />
                                </div>
                                <?php if (isset($error_name[$language['language_id']])) { ?>
                                <div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>
                                <?php } ?>
                                <?php } ?>
                              </div>
                            </div>
                          </div>
 
                          <div class="form-group">
                            <div class="row">
                              <label class="col-sm-2 control-label"><?php echo $entry_group; ?></label>
                              <div class="col-sm-5">
                                <select name="gixocaccount_el_customer[<?php echo $el_customer_row; ?>][customer_group_id]" id="input-gixocscd-group" class="form-control">
                                <?php foreach ($gixocaccount_groups_customer as $customer_group) { ?>
                                  <?php if ($customer_group['id'] == $el['customer_group_id']) { ?>
                                    <option value="<?php echo $customer_group['id']; ?>" selected="selected"><?php echo $customer_group['name'][$language_id]; ?></option>
                                  <?php } else { ?>
                                    <option value="<?php echo $customer_group['id']; ?>"><?php echo $customer_group['name'][$language_id]; ?></option>
                                  <?php } ?>
                                <?php } ?>
                                </select>
                              </div>
                              <label class="col-sm-2 control-label"><?php echo $entry_sort_order; ?></label>
                              <div class="col-sm-2">
                                <input type="text" name="gixocaccount_el_customer[<?php echo $el_customer_row; ?>][sort_order]" value="<?php echo $el['sort_order']; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />
                              </div>                              
                            </div>
                          </div>

                          <div class="form-group">
                            <div class="row">
                              <label class="col-sm-2 control-label"><?php echo $entry_image; ?></label>
                              <div class="col-sm-2">
                                <a href="" id="thumb-image_el_customer<?php echo $el_customer_row; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo $el['thumb']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="gixocaccount_el_customer[<?php echo $el_customer_row; ?>][image]" value="<?php echo $el['image']; ?>" id="input-image_el_customer<?php echo $el_customer_row; ?>" />                            
                              </div>
                              <label class="col-sm-2 control-label"><?php echo $entry_image_description; ?></label>
                              <div class="col-sm-5">
                                <div class="row">
                                  <div class="col-sm-6">
                                    <input type="text" name="gixocaccount_el_customer[<?php echo $el_customer_row; ?>][image_width]" value="<?php echo $el['image_width']; ?>" placeholder="<?php echo $entry_width; ?>" class="form-control" />
                                  </div>
                                  <div class="col-sm-6">
                                   <input type="text" name="gixocaccount_el_customer[<?php echo $el_customer_row; ?>][image_height]" value="<?php echo $el['image_height']; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                          
                          <div class="form-group">
                            <div class="row">
                              <label class="col-sm-2 control-label"><?php echo $entry_class_el; ?></label>
                              <div class="col-sm-5">
                                <input type="text" name="gixocaccount_el_customer[<?php echo $el_customer_row; ?>][class_el]" value="<?php echo $el['class_el']; ?>" placeholder="<?php echo $entry_class_el; ?>" id="input-class-el" class="form-control" />
                              </div>
                              <label class="col-sm-2 control-label"><?php echo $entry_color; ?></label>
                              <div class="col-sm-2">
                                <input type="text" name="gixocaccount_el_customer[<?php echo $el_customer_row; ?>][color]" value="<?php echo $el['color']; ?>" placeholder="<?php echo $entry_color; ?>" id="input-color" size="6" class="color {required:false,hash:true} form-control" />
                              </div>
                            </div>
                          </div>

                          <div class="form-group">
                            <div class="row">
                              <label class="col-sm-2 control-label"><?php echo $entry_url; ?></label>
                              <div class="col-sm-5">
                                <div class="input-group">
                                  <span class="input-group-addon"><?php echo $domain; ?></span>
                                  <input type="text" name="gixocaccount_el_customer[<?php echo $el_customer_row; ?>][url]" value="<?php echo $el['url']; ?>" placeholder="<?php echo $entry_url; ?>" id="input-url" class="form-control" />
                                </div>
                              </div>                            
                              <label class="col-sm-2 control-label"><?php echo $entry_color_hover; ?></label>
                              <div class="col-sm-2">
                                <input type="text" name="gixocaccount_el_customer[<?php echo $el_customer_row; ?>][color_hover]" value="<?php echo $el['color_hover']; ?>" placeholder="<?php echo $entry_color_hover; ?>" id="input-color-hover"  size="6" class="color {required:false,hash:true} form-control" />
                              </div>
                            </div>
                          </div>

                          <div class="form-group">
                            <div class="row">
                              <label class="col-sm-2 control-label"><?php echo $entry_status; ?></label>
                              <div class="col-sm-2">
                                <select name="gixocaccount_el_customer[<?php echo $el_customer_row; ?>][status]" id="input-status" class="form-control">
                                <?php if ($el['status']) { ?>
                                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                  <option value="0"><?php echo $text_disabled; ?></option>
                                <?php } else { ?>
                                  <option value="1"><?php echo $text_enabled; ?></option>
                                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                <?php } ?>
                                </select>
                              </div>
                              <label class="col-sm-1 control-label"><?php echo $entry_font; ?></label>
                              <div class="col-sm-2">
                                <div class="input-group">
                                  <input type="text" name="gixocaccount_el_customer[<?php echo $el_customer_row; ?>][font]" value="<?php echo $el['font']; ?>" placeholder="<?php echo $entry_font; ?>" id="input-font" class="form-control" />
                                  <span class="input-group-addon">px</span>
                                </div>
                              </div>
                              <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_info_font; ?>"><?php echo $entry_font_hover; ?></span></label>
                              <div class="col-sm-2">
                                <div class="input-group">
                                  <input type="text" name="gixocaccount_el_customer[<?php echo $el_customer_row; ?>][font_hover]" value="<?php echo $el['font_hover']; ?>" placeholder="<?php echo $entry_font_hover; ?>" id="input-font-hover" class="form-control" />
                                  <span class="input-group-addon">px</span>
                                </div>
                              </div>
                            </div>
                          </div>
                         </div>    
                        <?php $el_customer_row++; ?>
                        <?php } ?>
                        <?php } ?>   
                        </div>
                      </div>
                   </div>
                </div>
              </div>
            </div>
            <div class="tab-pane" id="tab-affiliate">
              <div class="row">
                <div class="col-sm-2">
                    <ul class="nav nav-pills nav-stacked" id="tab-design">
                        <li class="active"><a href="#tab-groups_affiliate" data-toggle="tab"><?php echo $entry_groups; ?></a></li>
                        <li><a href="#tab-el_affiliate" data-toggle="tab"><?php echo $entry_el; ?></a></li>
                    </ul>
                </div>
                <div class="col-sm-10">
                   <div class="tab-content">
                      <div class="tab-pane active" id="tab-groups_affiliate">
                        <div class="row">
                          <div class="form-group">
                            <div class="pull-right col-sm-3">
                              <button type="button" onclick="addGroups_affiliate();" data-toggle="tooltip" class="btn btn-primary"><i class="fa fa-plus-circle"></i> <?php echo $button_groups_add; ?></button>
                            </div>
                          </div>
                        </div>
                        <div id="groups_affiliate">
                        <?php $groups_affiliate_row = 0; ?>
                        <?php if ($gixocaccount_groups_affiliate) { ?>
                        <?php foreach ($gixocaccount_groups_affiliate as $groups) { ?>
                         <div class="well" id="groups_affiliate-row<?php echo $groups_affiliate_row; ?>">
                          <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger pull-right" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#groups_affiliate-row<?php echo $groups_affiliate_row; ?>').remove() : false;"><i class="fa fa-trash-o"></i></button>
                          <input type="hidden" name="gixocaccount_groups_affiliate[<?php echo $groups_affiliate_row; ?>][id]" value="<?php echo $groups_affiliate_row; ?>" id="input-id_groups_affiliate<?php echo $groups_affiliate_row; ?>" />
                          <div class="form-group">
                            <div class="row">
                              <label class="col-sm-2 control-label"><?php echo $entry_name; ?></label>
                              <div class="col-sm-9">
                                <?php foreach ($languages as $language) { ?>
                                <div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                                  <input type="text" name="gixocaccount_groups_affiliate[<?php echo $groups_affiliate_row; ?>][name][<?php echo $language['language_id']; ?>]" value="<?php echo isset($groups['name'][$language['language_id']]) ? $groups['name'][$language['language_id']] : ''; ?>" placeholder="<?php echo $entry_name; ?>" class="form-control" />
                                </div>
                                <?php if (isset($error_name[$language['language_id']])) { ?>
                                <div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>
                                <?php } ?>
                                <?php } ?>
                              </div>
                            </div>
                          </div>

                          <div class="form-group">
                            <div class="row">
                              <label class="col-sm-2 control-label"><?php echo $entry_class_el; ?></label>
                              <div class="col-sm-9">
                                <input type="text" name="gixocaccount_groups_affiliate[<?php echo $groups_affiliate_row; ?>][class_el]" value="<?php echo $groups['class_el']; ?>" placeholder="<?php echo $entry_class_el; ?>" id="input-class-el" class="form-control" />
                              </div>
                            </div>
                          </div>
                          
                          <div class="form-group">
                            <div class="row">
                              <label class="col-sm-2 control-label"><?php echo $entry_sort_order; ?></label>
                              <div class="col-sm-1">
                                <input type="text" name="gixocaccount_groups_affiliate[<?php echo $groups_affiliate_row; ?>][sort_order]" value="<?php echo $groups['sort_order']; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />
                              </div>                              
                              <label class="col-sm-2 control-label"><?php echo $entry_color; ?></label>
                              <div class="col-sm-2">
                                <input type="text" name="gixocaccount_groups_affiliate[<?php echo $groups_affiliate_row; ?>][color]" value="<?php echo $groups['color']; ?>" placeholder="<?php echo $entry_color; ?>" id="input-color" size="6" class="color {required:false,hash:true} form-control" />
                              </div>
                              <label class="col-sm-2 control-label"><?php echo $entry_color_hover; ?></label>
                              <div class="col-sm-2">
                                <input type="text" name="gixocaccount_groups_affiliate[<?php echo $groups_affiliate_row; ?>][color_hover]" value="<?php echo $groups['color_hover']; ?>" placeholder="<?php echo $entry_color_hover; ?>" id="input-color-hover"  size="6" class="color {required:false,hash:true} form-control" />
                              </div>
                            </div>
                          </div>
                          
                          <div class="form-group">
                            <div class="row">
                              <label class="col-sm-2 control-label"><?php echo $entry_status; ?></label>
                              <div class="col-sm-2">
                                <select name="gixocaccount_groups_affiliate[<?php echo $groups_affiliate_row; ?>][status]" id="input-status" class="form-control">
                                <?php if ($groups['status']) { ?>
                                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                  <option value="0"><?php echo $text_disabled; ?></option>
                                <?php } else { ?>
                                  <option value="1"><?php echo $text_enabled; ?></option>
                                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                <?php } ?>
                                </select>
                              </div>
                              <label class="col-sm-1 control-label"><?php echo $entry_font; ?></label>
                              <div class="col-sm-2">
                                <div class="input-group">
                                  <input type="text" name="gixocaccount_groups_affiliate[<?php echo $groups_affiliate_row; ?>][font]" value="<?php echo $groups['font']; ?>" placeholder="<?php echo $entry_font; ?>" id="input-font" class="form-control" />
                                  <span class="input-group-addon">px</span>
                                </div>
                              </div>
                              <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_info_font; ?>"><?php echo $entry_font_hover; ?></span></label>
                              <div class="col-sm-2">
                                <div class="input-group">
                                  <input type="text" name="gixocaccount_groups_affiliate[<?php echo $groups_affiliate_row; ?>][font_hover]" value="<?php echo $groups['font_hover']; ?>" placeholder="<?php echo $entry_font_hover; ?>" id="input-font-hover" class="form-control" />
                                  <span class="input-group-addon">px</span>
                                </div>
                              </div>
                            </div>
                          </div>
                         </div>    
                        <?php $groups_affiliate_row++; ?>
                        <?php } ?>
                        <?php } ?>   
                        </div>
                      </div>
                      <div class="tab-pane" id="tab-el_affiliate">
                        <div class="row">
                          <div class="form-group">
                            <div class="pull-right col-sm-3">
                              <button type="button" onclick="addEl_affiliate();" data-toggle="tooltip" class="btn btn-primary"><i class="fa fa-plus-circle"></i> <?php echo $button_el_add; ?></button>
                            </div>
                          </div>
                        </div>
                        <div id="el_affiliate">
                        <?php $el_affiliate_row = 0; ?>
                        <?php if ($gixocaccount_el_affiliate) { ?>
                        <?php foreach ($gixocaccount_el_affiliate as $el) { ?>
                         <div class="well" id="el_affiliate-row<?php echo $el_affiliate_row; ?>">
                          <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger pull-right" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#el_affiliate-row<?php echo $el_affiliate_row; ?>').remove() : false;"><i class="fa fa-trash-o"></i></button>
                          <input type="hidden" name="gixocaccount_el_affiliate[<?php echo $el_affiliate_row; ?>][id]" value="<?php echo $el_affiliate_row; ?>" id="input-id_el_affiliate<?php echo $el_affiliate_row; ?>" />
                          <div class="form-group">
                            <div class="row">
                              <label class="col-sm-2 control-label"><?php echo $entry_name; ?></label>
                              <div class="col-sm-9">
                                <?php foreach ($languages as $language) { ?>
                                <div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                                  <input type="text" name="gixocaccount_el_affiliate[<?php echo $el_affiliate_row; ?>][name][<?php echo $language['language_id']; ?>]" value="<?php echo isset($el['name'][$language['language_id']]) ? $el['name'][$language['language_id']] : ''; ?>" placeholder="<?php echo $entry_name; ?>" class="form-control" />
                                </div>
                                <?php if (isset($error_name[$language['language_id']])) { ?>
                                <div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>
                                <?php } ?>
                                <?php } ?>
                              </div>
                            </div>
                          </div>
 
                          <div class="form-group">
                            <div class="row">
                              <label class="col-sm-2 control-label"><?php echo $entry_group; ?></label>
                              <div class="col-sm-5">
                                <select name="gixocaccount_el_affiliate[<?php echo $el_affiliate_row; ?>][affiliate_group_id]" id="input-gixocscd-group" class="form-control">
                                  <?php foreach ($gixocaccount_groups_affiliate as $affiliate_group) { ?>
                                  <?php if ($affiliate_group['id'] == $el['affiliate_group_id']) { ?>
                                    <option value="<?php echo $affiliate_group['id']; ?>" selected="selected"><?php echo $affiliate_group['name'][$language_id]; ?></option>
                                  <?php } else { ?>
                                    <option value="<?php echo $affiliate_group['id']; ?>"><?php echo $affiliate_group['name'][$language_id]; ?></option>
                                  <?php } ?>
                                  <?php } ?>                             
                                </select>
                              </div>
                              <label class="col-sm-2 control-label"><?php echo $entry_sort_order; ?></label>
                              <div class="col-sm-2">
                                <input type="text" name="gixocaccount_el_affiliate[<?php echo $el_affiliate_row; ?>][sort_order]" value="<?php echo $el['sort_order']; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />
                              </div>                              
                            </div>
                          </div>

                          <div class="form-group">
                            <div class="row">
                              <label class="col-sm-2 control-label"><?php echo $entry_image; ?></label>
                              <div class="col-sm-2">
                                <a href="" id="thumb-image_el_affiliate<?php echo $el_affiliate_row; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo $el['thumb']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="gixocaccount_el_affiliate[<?php echo $el_affiliate_row; ?>][image]" value="<?php echo $el['image']; ?>" id="input-image_el_affiliate<?php echo $el_affiliate_row; ?>" />
                              </div>
                              <label class="col-sm-2 control-label"><?php echo $entry_image_description; ?></label>
                              <div class="col-sm-5">
                                <div class="row">
                                  <div class="col-sm-6">
                                    <input type="text" name="gixocaccount_el_affiliate[<?php echo $el_affiliate_row; ?>][image_width]" value="<?php echo $el['image_width']; ?>" placeholder="<?php echo $entry_width; ?>" class="form-control" />
                                  </div>
                                  <div class="col-sm-6">
                                   <input type="text" name="gixocaccount_el_affiliate[<?php echo $el_affiliate_row; ?>][image_height]" value="<?php echo $el['image_height']; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                          
                          <div class="form-group">
                            <div class="row">
                              <label class="col-sm-2 control-label"><?php echo $entry_class_el; ?></label>
                              <div class="col-sm-5">
                                <input type="text" name="gixocaccount_el_affiliate[<?php echo $el_affiliate_row; ?>][class_el]" value="<?php echo $el['class_el']; ?>" placeholder="<?php echo $entry_class_el; ?>" id="input-class-el" class="form-control" />
                              </div>
                              <label class="col-sm-2 control-label"><?php echo $entry_color; ?></label>
                              <div class="col-sm-2">
                                <input type="text" name="gixocaccount_el_affiliate[<?php echo $el_affiliate_row; ?>][color]" value="<?php echo $el['color']; ?>" placeholder="<?php echo $entry_color; ?>" id="input-color" size="6" class="color {required:false,hash:true} form-control" />
                              </div>
                            </div>
                          </div>

                          <div class="form-group">
                            <div class="row">
                              <label class="col-sm-2 control-label"><?php echo $entry_url; ?></label>
                              <div class="col-sm-5">
                                <div class="input-group">
                                  <span class="input-group-addon"><?php echo $domain; ?></span>
                                  <input type="text" name="gixocaccount_el_affiliate[<?php echo $el_affiliate_row; ?>][url]" value="<?php echo $el['url']; ?>" placeholder="<?php echo $entry_url; ?>" id="input-url" class="form-control" />
                                </div>
                              </div>                            
                              <label class="col-sm-2 control-label"><?php echo $entry_color_hover; ?></label>
                              <div class="col-sm-2">
                                <input type="text" name="gixocaccount_el_affiliate[<?php echo $el_affiliate_row; ?>][color_hover]" value="<?php echo $el['color_hover']; ?>" placeholder="<?php echo $entry_color_hover; ?>" id="input-color-hover"  size="6" class="color {required:false,hash:true} form-control" />
                              </div>
                            </div>
                          </div>

                          <div class="form-group">
                            <div class="row">
                              <label class="col-sm-2 control-label"><?php echo $entry_status; ?></label>
                              <div class="col-sm-2">
                                <select name="gixocaccount_el_affiliate[<?php echo $el_affiliate_row; ?>][status]" id="input-status" class="form-control">
                                <?php if ($el['status']) { ?>
                                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                  <option value="0"><?php echo $text_disabled; ?></option>
                                <?php } else { ?>
                                  <option value="1"><?php echo $text_enabled; ?></option>
                                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                <?php } ?>
                                </select>
                              </div>
                              <label class="col-sm-1 control-label"><?php echo $entry_font; ?></label>
                              <div class="col-sm-2">
                                <div class="input-group">
                                  <input type="text" name="gixocaccount_el_affiliate[<?php echo $el_affiliate_row; ?>][font]" value="<?php echo $el['font']; ?>" placeholder="<?php echo $entry_font; ?>" id="input-font" class="form-control" />
                                  <span class="input-group-addon">px</span>
                                </div>
                              </div>
                              <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_info_font; ?>"><?php echo $entry_font_hover; ?></span></label>
                              <div class="col-sm-2">
                                <div class="input-group">
                                  <input type="text" name="gixocaccount_el_affiliate[<?php echo $el_affiliate_row; ?>][font_hover]" value="<?php echo $el['font_hover']; ?>" placeholder="<?php echo $entry_font_hover; ?>" id="input-font-hover" class="form-control" />
                                  <span class="input-group-addon">px</span>
                                </div>
                              </div>
                            </div>
                          </div>
                         </div>    
                        <?php $el_affiliate_row++; ?>
                        <?php } ?>
                        <?php } ?>   
                        </div>
                      </div>
                   </div>
                </div>
              </div>
            </div>
            <div class="tab-pane" id="tab-module_customer">
              <div class="row">
                  <div class="form-group">
                    <div class="pull-right col-sm-3">
                      <button type="button" onclick="addModule_customer();" data-toggle="tooltip" class="btn btn-primary"><i class="fa fa-plus-circle"></i> <?php echo $button_el_add; ?></button>
                    </div>
                  </div>
              </div>
              <div id="module_customer">
              <?php $module_customer_row = 0; ?>
              <?php if ($gixocaccount_module_customer) { ?>
              <?php foreach ($gixocaccount_module_customer as $module) { ?>
               <div class="well" id="module_customer-row<?php echo $module_customer_row; ?>">
                <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger pull-right" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#module_customer-row<?php echo $module_customer_row; ?>').remove() : false;"><i class="fa fa-trash-o"></i></button>
                <input type="hidden" name="gixocaccount_module_customer[<?php echo $module_customer_row; ?>][id]" value="<?php echo $module_customer_row; ?>" id="input-id_groups_customer<?php echo $module_customer_row; ?>" />
                <div class="form-group">
                  <div class="row">
                    <label class="col-sm-2 control-label"><?php echo $entry_name; ?></label>
                    <div class="col-sm-9">
                      <?php foreach ($languages as $language) { ?>
                      <div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                        <input type="text" name="gixocaccount_module_customer[<?php echo $module_customer_row; ?>][name][<?php echo $language['language_id']; ?>]" value="<?php echo isset($module['name'][$language['language_id']]) ? $module['name'][$language['language_id']] : ''; ?>" placeholder="<?php echo $entry_name; ?>" class="form-control" />
                      </div>
                      <?php if (isset($error_name[$language['language_id']])) { ?>
                      <div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>
                      <?php } ?>
                      <?php } ?>
                    </div>
                  </div>
                </div>

                <div class="form-group">
                  <div class="row">
                    <label class="col-sm-2 control-label"><?php echo $entry_class_el; ?></label>
                    <div class="col-sm-3">
                      <input type="text" name="gixocaccount_module_customer[<?php echo $module_customer_row; ?>][class_el]" value="<?php echo $module['class_el']; ?>" placeholder="<?php echo $entry_class_el; ?>" id="input-class-el" class="form-control" />
                    </div>
                    <label class="col-sm-1 control-label"><?php echo $entry_url; ?></label>
                    <div class="col-sm-5">
                      <div class="input-group">
                        <span class="input-group-addon"><?php echo $domain; ?></span>
                        <input type="text" name="gixocaccount_module_customer[<?php echo $module_customer_row; ?>][url]" value="<?php echo $module['url']; ?>" placeholder="<?php echo $entry_url; ?>" id="input-url" class="form-control" />
                      </div>
                    </div> 
                  </div>
                </div>
                
                <div class="form-group">
                  <div class="row">
                    <label class="col-sm-2 control-label"><?php echo $entry_sort_order; ?></label>
                    <div class="col-sm-1">
                      <input type="text" name="gixocaccount_module_customer[<?php echo $module_customer_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />
                    </div>                    
                    <label class="col-sm-2 control-label"><?php echo $entry_color; ?></label>
                    <div class="col-sm-2">
                      <input type="text" name="gixocaccount_module_customer[<?php echo $module_customer_row; ?>][color]" value="<?php echo $module['color']; ?>" placeholder="<?php echo $entry_color; ?>" id="input-color" size="6" class="color {required:false,hash:true} form-control" />
                    </div>
                    <label class="col-sm-2 control-label"><?php echo $entry_color_hover; ?></label>
                    <div class="col-sm-2">
                      <input type="text" name="gixocaccount_module_customer[<?php echo $module_customer_row; ?>][color_hover]" value="<?php echo $module['color_hover']; ?>" placeholder="<?php echo $entry_color_hover; ?>" id="input-color-hover"  size="6" class="color {required:false,hash:true} form-control" />
                    </div>
                  </div>
                </div>
                
                <div class="form-group">
                  <div class="row">
                    <label class="col-sm-2 control-label"><?php echo $entry_status; ?></label>
                    <div class="col-sm-2">
                      <select name="gixocaccount_module_customer[<?php echo $module_customer_row; ?>][status]" id="input-status" class="form-control">
                      <?php if ($module['status']) { ?>
                        <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                        <option value="0"><?php echo $text_disabled; ?></option>
                      <?php } else { ?>
                        <option value="1"><?php echo $text_enabled; ?></option>
                        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                      <?php } ?>
                      </select>
                    </div>
                    <label class="col-sm-1 control-label"><?php echo $entry_font; ?></label>
                    <div class="col-sm-2">
                      <div class="input-group">
                        <input type="text" name="gixocaccount_module_customer[<?php echo $module_customer_row; ?>][font]" value="<?php echo $module['font']; ?>" placeholder="<?php echo $entry_font; ?>" id="input-font" class="form-control" />
                        <span class="input-group-addon">px</span>
                      </div>
                    </div>
                    <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_info_font; ?>"><?php echo $entry_font_hover; ?></span></label>
                    <div class="col-sm-2">
                      <div class="input-group">
                        <input type="text" name="gixocaccount_module_customer[<?php echo $module_customer_row; ?>][font_hover]" value="<?php echo $module['font_hover']; ?>" placeholder="<?php echo $entry_font_hover; ?>" id="input-font-hover" class="form-control" />
                        <span class="input-group-addon">px</span>
                      </div>
                    </div>
                  </div>
                </div>
               </div>    
              <?php $module_customer_row++; ?>
              <?php } ?>
              <?php } ?>   
              </div>
            </div>
            <div class="tab-pane" id="tab-module_affiliate">
              <div class="row">
                  <div class="form-group">
                    <div class="pull-right col-sm-3">
                      <button type="button" onclick="addModule_affiliate();" data-toggle="tooltip" class="btn btn-primary"><i class="fa fa-plus-circle"></i> <?php echo $button_el_add; ?></button>
                    </div>
                  </div>
              </div>
              <div id="module_affiliate">
              <?php $module_affiliate_row = 0; ?>
              <?php if ($gixocaccount_module_affiliate) { ?>
              <?php foreach ($gixocaccount_module_affiliate as $module) { ?>
               <div class="well" id="module_affiliate-row<?php echo $module_affiliate_row; ?>">
                <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger pull-right" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#module_affiliate-row<?php echo $module_affiliate_row; ?>').remove() : false;"><i class="fa fa-trash-o"></i></button>
                <input type="hidden" name="gixocaccount_module_affiliate[<?php echo $module_affiliate_row; ?>][id]" value="<?php echo $module_affiliate_row; ?>" id="input-id_groups_affiliate<?php echo $module_affiliate_row; ?>" />
                <div class="form-group">
                  <div class="row">
                    <label class="col-sm-2 control-label"><?php echo $entry_name; ?></label>
                    <div class="col-sm-9">
                      <?php foreach ($languages as $language) { ?>
                      <div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                        <input type="text" name="gixocaccount_module_affiliate[<?php echo $module_affiliate_row; ?>][name][<?php echo $language['language_id']; ?>]" value="<?php echo isset($module['name'][$language['language_id']]) ? $module['name'][$language['language_id']] : ''; ?>" placeholder="<?php echo $entry_name; ?>" class="form-control" />
                      </div>
                      <?php if (isset($error_name[$language['language_id']])) { ?>
                      <div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>
                      <?php } ?>
                      <?php } ?>
                    </div>
                  </div>
                </div>

                <div class="form-group">
                  <div class="row">
                    <label class="col-sm-2 control-label"><?php echo $entry_class_el; ?></label>
                    <div class="col-sm-3">
                      <input type="text" name="gixocaccount_module_affiliate[<?php echo $module_affiliate_row; ?>][class_el]" value="<?php echo $module['class_el']; ?>" placeholder="<?php echo $entry_class_el; ?>" id="input-class-el" class="form-control" />
                    </div>
                    <label class="col-sm-1 control-label"><?php echo $entry_url; ?></label>
                    <div class="col-sm-5">
                      <div class="input-group">
                        <span class="input-group-addon"><?php echo $domain; ?></span>
                        <input type="text" name="gixocaccount_module_affiliate[<?php echo $module_affiliate_row; ?>][url]" value="<?php echo $module['url']; ?>" placeholder="<?php echo $entry_url; ?>" id="input-url" class="form-control" />
                      </div>
                    </div> 
                  </div>
                </div>
                
                <div class="form-group">
                  <div class="row">
                    <label class="col-sm-2 control-label"><?php echo $entry_sort_order; ?></label>
                    <div class="col-sm-1">
                      <input type="text" name="gixocaccount_module_affiliate[<?php echo $module_affiliate_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />
                    </div>                    
                    <label class="col-sm-2 control-label"><?php echo $entry_color; ?></label>
                    <div class="col-sm-2">
                      <input type="text" name="gixocaccount_module_affiliate[<?php echo $module_affiliate_row; ?>][color]" value="<?php echo $module['color']; ?>" placeholder="<?php echo $entry_color; ?>" id="input-color" size="6" class="color {required:false,hash:true} form-control" />
                    </div>
                    <label class="col-sm-2 control-label"><?php echo $entry_color_hover; ?></label>
                    <div class="col-sm-2">
                      <input type="text" name="gixocaccount_module_affiliate[<?php echo $module_affiliate_row; ?>][color_hover]" value="<?php echo $module['color_hover']; ?>" placeholder="<?php echo $entry_color_hover; ?>" id="input-color-hover"  size="6" class="color {required:false,hash:true} form-control" />
                    </div>
                  </div>
                </div>
                
                <div class="form-group">
                  <div class="row">
                    <label class="col-sm-2 control-label"><?php echo $entry_status; ?></label>
                    <div class="col-sm-2">
                      <select name="gixocaccount_module_affiliate[<?php echo $module_affiliate_row; ?>][status]" id="input-status" class="form-control">
                      <?php if ($module['status']) { ?>
                        <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                        <option value="0"><?php echo $text_disabled; ?></option>
                      <?php } else { ?>
                        <option value="1"><?php echo $text_enabled; ?></option>
                        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                      <?php } ?>
                      </select>
                    </div>
                    <label class="col-sm-1 control-label"><?php echo $entry_font; ?></label>
                    <div class="col-sm-2">
                      <div class="input-group">
                        <input type="text" name="gixocaccount_module_affiliate[<?php echo $module_affiliate_row; ?>][font]" value="<?php echo $module['font']; ?>" placeholder="<?php echo $entry_font; ?>" id="input-font" class="form-control" />
                        <span class="input-group-addon">px</span>
                      </div>
                    </div>
                    <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_info_font; ?>"><?php echo $entry_font_hover; ?></span></label>
                    <div class="col-sm-2">
                      <div class="input-group">
                        <input type="text" name="gixocaccount_module_affiliate[<?php echo $module_affiliate_row; ?>][font_hover]" value="<?php echo $module['font_hover']; ?>" placeholder="<?php echo $entry_font_hover; ?>" id="input-font-hover" class="form-control" />
                        <span class="input-group-addon">px</span>
                      </div>
                    </div>
                  </div>
                </div>
               </div>    
              <?php $module_affiliate_row++; ?>
              <?php } ?>
              <?php } ?>   
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript" src="view/javascript/jscolor/jscolor.js"></script>
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

<?php if (empty($gixocaccount_module_customer)) { ?>
$(document).ready(function() {
    addModule_customer();
});
<?php } ?>

<?php if (empty($gixocaccount_module_affiliate)) { ?>
$(document).ready(function() {
    addModule_affiliate();
});
<?php } ?>

var groups_customer_row = <?php echo $groups_customer_row; ?>;

function addGroups_customer() {
html = '                         <div class="well" id="groups_customer-row' + groups_customer_row + '">';
html += '                          <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger pull-right" onclick="confirm(\'<?php echo $text_confirm; ?>\') ? $(\'#groups_customer-row' + groups_customer_row + '\').remove() : false;"><i class="fa fa-trash-o"></i></button>';
html += '                          <input type="hidden" name="gixocaccount_groups_customer[' + groups_customer_row + '][id]" value="' + groups_customer_row + '" id="input-id_groups_customer' + groups_customer_row + '" />';
html += '                          <div class="form-group">';
html += '                            <div class="row">';
html += '                              <label class="col-sm-2 control-label"><?php echo $entry_name; ?></label>';
html += '                              <div class="col-sm-9">';
html += '                                <?php foreach ($languages as $language) { ?>';
html += '                                <div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>';
html += '                                  <input type="text" name="gixocaccount_groups_customer[' + groups_customer_row + '][name][<?php echo $language['language_id']; ?>]" value="" placeholder="<?php echo $entry_name; ?>" class="form-control" />';
html += '                                </div>';
html += '                                <?php if (isset($error_name[$language['language_id']])) { ?>';
html += '                                <div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>';
html += '                                <?php } ?>';
html += '                                <?php } ?>';
html += '                              </div>';
html += '                            </div>';
html += '                          </div>';
html += '                          <div class="form-group">';
html += '                            <div class="row">';
html += '                              <label class="col-sm-2 control-label"><?php echo $entry_class_el; ?></label>';
html += '                              <div class="col-sm-9">';
html += '                                <input type="text" name="gixocaccount_groups_customer[' + groups_customer_row + '][class_el]" value="h2" placeholder="<?php echo $entry_class_el; ?>" id="input-class-el" class="form-control" />';
html += '                              </div>';
html += '                            </div>';
html += '                          </div>';
html += '                          <div class="form-group">';
html += '                            <div class="row">';
html += '                             <label class="col-sm-2 control-label"><?php echo $entry_sort_order; ?></label>';
html += '                             <div class="col-sm-1">';
html += '                               <input type="text" name="gixocaccount_groups_customer[' + groups_customer_row + '][sort_order]" value="" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />';
html += '                             </div>';
html += '                             <label class="col-sm-2 control-label"><?php echo $entry_color; ?></label>';
html += '                             <div class="col-sm-2">';
html += '                               <input type="text" name="gixocaccount_groups_customer[' + groups_customer_row + '][color]" value="#000000" id="input-color" size="6" class="color {required:false,hash:true} form-control" />';
html += '                             </div>';
html += '                              <label class="col-sm-2 control-label"><?php echo $entry_color_hover; ?></label>';
html += '                              <div class="col-sm-2">';
html += '                                <input type="text" name="gixocaccount_groups_customer[' + groups_customer_row + '][color_hover]" value="#000000" placeholder="<?php echo $entry_color_hover; ?>" id="input-color-hover"  size="6" class="color {required:false,hash:true} form-control" />';
html += '                              </div>';
html += '                            </div>';
html += '                          </div>';
html += '                          <div class="form-group">';
html += '                            <div class="row">';
html += '                              <label class="col-sm-2 control-label"><?php echo $entry_status; ?></label>';
html += '                              <div class="col-sm-2">';
html += '                                <select name="gixocaccount_groups_customer[' + groups_customer_row + '][status]" id="input-status" class="form-control">';
html += '                                  <option value="1"><?php echo $text_enabled; ?></option>';
html += '                                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>';
html += '                                </select>';
html += '                              </div>';
html += '                              <label class="col-sm-1 control-label"><?php echo $entry_font; ?></label>';
html += '                              <div class="col-sm-2">';
html += '                                <div class="input-group">';
html += '                                  <input type="text" name="gixocaccount_groups_customer[' + groups_customer_row + '][font]" value="27" placeholder="<?php echo $entry_font; ?>" id="input-font" class="form-control" />';
html += '                                  <span class="input-group-addon">px</span>';
html += '                                </div>';
html += '                              </div>';
html += '                              <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_info_font; ?>"><?php echo $entry_font_hover; ?></span></label>';
html += '                              <div class="col-sm-2">';
html += '                                <div class="input-group">';
html += '                                  <input type="text" name="gixocaccount_groups_customer[' + groups_customer_row + '][font_hover]" value="28" placeholder="<?php echo $entry_font_hover; ?>" id="input-font-hover" class="form-control" />';
html += '                                  <span class="input-group-addon">px</span>';
html += '                                </div>';
html += '                              </div>';
html += '                            </div>';
html += '                          </div>';
html += '                         </div>';

    $('#groups_customer').append(html);
    $([document.documentElement, document.body]).animate({
      scrollTop: $('#groups_customer-row' + groups_customer_row).offset().top
    }, 2000);
    groups_customer_row++;
}

var el_customer_row = <?php echo $el_customer_row; ?>;

function addEl_customer() {
html = '                         <div class="well" id="el_customer-row' + el_customer_row + '">';
html += '        <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger pull-right" onclick="confirm(\'<?php echo $text_confirm; ?>\') ? $(\'#el_customer-row' + el_customer_row + '\').remove() : false;"><i class="fa fa-trash-o"></i></button>';
html += '                          <input type="hidden" name="gixocaccount_el_customer[' + el_customer_row + '][id]" value="' + el_customer_row + '" id="input-id_el_customer' + el_customer_row + '" />';
html += '            <div class="form-group">';
html += '                            <div class="row">';
html += '         <label class="col-sm-2 control-label"><?php echo $entry_name; ?></label>';
html += '         <div class="col-sm-9">';
html += '        <?php foreach ($languages as $language) { ?>';
html += '                                <div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>';
html += '          <input type="text" name="gixocaccount_el_customer[' + el_customer_row + '][name][<?php echo $language['language_id']; ?>]" value="" placeholder="<?php echo $entry_name; ?>" class="form-control" />';
html += '        </div>';
html += '        <?php if (isset($error_name[$language['language_id']])) { ?>';
html += '        <div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>';
html += '        <?php } ?>';
html += '        <?php } ?>';
html += '                              </div>';
html += '       </div>';
html += '                          </div>';
html += '                          <div class="form-group">';
html += '                            <div class="row">';
html += '         <label class="col-sm-2 control-label"><?php echo $entry_group; ?></label>';
html += '         <div class="col-sm-5">';
html += '                                <select name="gixocaccount_el_customer[' + el_customer_row + '][customer_group_id]" id="input-gixocscd-group" class="form-control">';
html += '                                  <?php foreach ($gixocaccount_groups_customer as $customer_group) { ?>';
html += '                                  <option value="<?php echo $customer_group['id']; ?>"><?php echo $customer_group['name'][$language_id]; ?></option>';
html += '                                  <?php } ?>';
html += '                                </select>';
html += '                              </div>';
html += '         <label class="col-sm-2 control-label"><?php echo $entry_sort_order; ?></label>';
html += '         <div class="col-sm-2">';
html += '        <input type="text" name="gixocaccount_el_customer[' + el_customer_row + '][sort_order]" value="<?php echo $el['sort_order']; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />';
html += '                              </div>         ';
html += '       </div>';
html += '                          </div>';
html += '                          <div class="form-group">';
html += '                            <div class="row">';
html += '                              <label class="col-sm-2 control-label"><?php echo $entry_image; ?></label>';
html += '                                <div class="col-sm-2">';
html += '                                  <a href="" id="thumb-image_el_customer' + el_customer_row + '" data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="gixocaccount_el_customer[' + el_customer_row + '][image]" value="<?php echo $el['image']; ?>" id="input-image_el_customer' + el_customer_row + '" />';
html += '                                </div>';
html += '                                <label class="col-sm-2 control-label"><?php echo $entry_image_description; ?></label>';
html += '                                <div class="col-sm-5">';
html += '                                  <div class="row">';
html += '                                    <div class="col-sm-6">';
html += '                                      <input type="text" name="gixocaccount_el_customer[' + el_customer_row + '][image_width]" value="64" placeholder="<?php echo $entry_width; ?>" class="form-control" />';
html += '                                    </div>';
html += '                                    <div class="col-sm-6">';
html += '                                      <input type="text" name="gixocaccount_el_customer[' + el_customer_row + '][image_height]" value="64" placeholder="<?php echo $entry_height; ?>" class="form-control" />';
html += '                                    </div>';
html += '                                  </div>';
html += '                                </div>';
html += '                            </div>';
html += '                          </div>';
html += '                          <div class="form-group">';
html += '                            <div class="row">';
html += '         <label class="col-sm-2 control-label"><?php echo $entry_class_el; ?></label>';
html += '         <div class="col-sm-5">';
html += '        <input type="text" name="gixocaccount_el_customer[' + el_customer_row + '][class_el]" value="col-lg-2 col-md-3 col-sm-4 col-xs-6 text-center" placeholder="<?php echo $entry_class_el; ?>" id="input-class-el" class="form-control" />';
html += '                              </div>';
html += '         <label class="col-sm-2 control-label"><?php echo $entry_color; ?></label>';
html += '         <div class="col-sm-2">';
html += '        <input type="text" name="gixocaccount_el_customer[' + el_customer_row + '][color]" value="#000000" placeholder="<?php echo $entry_color; ?>" id="input-color" size="6" class="color {required:false,hash:true} form-control" />';
html += '                              </div>';
html += '       </div>';
html += '                          </div>';
html += '                          <div class="form-group">';
html += '                            <div class="row">';
html += '         <label class="col-sm-2 control-label"><?php echo $entry_url; ?></label>';
html += '         <div class="col-sm-5">';
html += '        <div class="input-group">';
html += '                                  <span class="input-group-addon"><?php echo $domain; ?></span>';
html += '                                  <input type="text" name="gixocaccount_el_customer[' + el_customer_row + '][url]" value="" placeholder="<?php echo $entry_url; ?>" id="input-url" class="form-control" />';
html += '                                </div>';
html += '                              </div>';
html += '         <label class="col-sm-2 control-label"><?php echo $entry_color_hover; ?></label>';
html += '         <div class="col-sm-2">';
html += '        <input type="text" name="gixocaccount_el_customer[' + el_customer_row + '][color_hover]" value="#000000" placeholder="<?php echo $entry_color_hover; ?>" id="input-color-hover"  size="6" class="color {required:false,hash:true} form-control" />';
html += '                              </div>';
html += '       </div>';
html += '                          </div>';
html += '                          <div class="form-group">';
html += '                            <div class="row">';
html += '         <label class="col-sm-2 control-label"><?php echo $entry_status; ?></label>';
html += '         <div class="col-sm-2">';
html += '        <select name="gixocaccount_el_customer[' + el_customer_row + '][status]" id="input-status" class="form-control">';
html += '                                  <option value="1"><?php echo $text_enabled; ?></option>';
html += '                                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>';
html += '                                </select>';
html += '                              </div>';
html += '         <label class="col-sm-1 control-label"><?php echo $entry_font; ?></label>';
html += '         <div class="col-sm-2">';
html += '        <div class="input-group">';
html += '                                  <input type="text" name="gixocaccount_el_customer[' + el_customer_row + '][font]" value="14" placeholder="<?php echo $entry_font; ?>" id="input-font" class="form-control" />';
html += '                                  <span class="input-group-addon">px</span>';
html += '                                </div>';
html += '                              </div>';
html += '         <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_info_font; ?>"><?php echo $entry_font_hover; ?></span></label>';
html += '         <div class="col-sm-2">';
html += '        <div class="input-group">';
html += '                                  <input type="text" name="gixocaccount_el_customer[' + el_customer_row + '][font_hover]" value="15" placeholder="<?php echo $entry_font_hover; ?>" id="input-font-hover" class="form-control" />';
html += '                                  <span class="input-group-addon">px</span>';
html += '                                </div>';
html += '                              </div>';
html += '       </div>';
html += '                          </div>';
html += '       </div> ';

    $('#el_customer').append(html);
    $([document.documentElement, document.body]).animate({
      scrollTop: $('#el_customer-row' + el_customer_row).offset().top
    }, 2000);
    el_customer_row++;
}

var groups_affiliate_row = <?php echo $groups_affiliate_row; ?>;

function addGroups_affiliate() {
html = '                         <div class="well" id="groups_affiliate-row' + groups_affiliate_row + '">';
html += '                          <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger pull-right" onclick="confirm(\'<?php echo $text_confirm; ?>\') ? $(\'#groups_affiliate-row' + groups_affiliate_row + '\').remove() : false;"><i class="fa fa-trash-o"></i></button>';
html += '                          <input type="hidden" name="gixocaccount_groups_affiliate[' + groups_affiliate_row + '][id]" value="' + groups_affiliate_row + '" id="input-id_groups_affiliate' + groups_affiliate_row + '" />';
html += '                          <div class="form-group">';
html += '                            <div class="row">';
html += '                              <label class="col-sm-2 control-label"><?php echo $entry_name; ?></label>';
html += '                              <div class="col-sm-9">';
html += '                                <?php foreach ($languages as $language) { ?>';
html += '                                <div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>';
html += '                                  <input type="text" name="gixocaccount_groups_affiliate[' + groups_affiliate_row + '][name][<?php echo $language['language_id']; ?>]" value="" placeholder="<?php echo $entry_name; ?>" class="form-control" />';
html += '                                </div>';
html += '                                <?php if (isset($error_name[$language['language_id']])) { ?>';
html += '                                <div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>';
html += '                                <?php } ?>';
html += '                                <?php } ?>';
html += '                              </div>';
html += '                            </div>';
html += '                          </div>';
html += '                          <div class="form-group">';
html += '                            <div class="row">';
html += '                              <label class="col-sm-2 control-label"><?php echo $entry_class_el; ?></label>';
html += '                              <div class="col-sm-9">';
html += '                                <input type="text" name="gixocaccount_groups_affiliate[' + groups_affiliate_row + '][class_el]" value="h2" placeholder="<?php echo $entry_class_el; ?>" id="input-class-el" class="form-control" />';
html += '                              </div>';
html += '                            </div>';
html += '                          </div>';
html += '                          <div class="form-group">';
html += '                            <div class="row">';
html += '                             <label class="col-sm-2 control-label"><?php echo $entry_sort_order; ?></label>';
html += '                             <div class="col-sm-1">';
html += '                               <input type="text" name="gixocaccount_groups_affiliate[' + groups_affiliate_row + '][sort_order]" value="" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />';
html += '                             </div>';
html += '                             <label class="col-sm-2 control-label"><?php echo $entry_color; ?></label>';
html += '                             <div class="col-sm-2">';
html += '                               <input type="text" name="gixocaccount_groups_affiliate[' + groups_affiliate_row + '][color]" value="#000000" id="input-color" size="6" class="color {required:false,hash:true} form-control" />';
html += '                             </div>';
html += '                              <label class="col-sm-2 control-label"><?php echo $entry_color_hover; ?></label>';
html += '                              <div class="col-sm-2">';
html += '                                <input type="text" name="gixocaccount_groups_affiliate[' + groups_affiliate_row + '][color_hover]" value="#000000" placeholder="<?php echo $entry_color_hover; ?>" id="input-color-hover"  size="6" class="color {required:false,hash:true} form-control" />';
html += '                              </div>';
html += '                            </div>';
html += '                          </div>';
html += '                          <div class="form-group">';
html += '                            <div class="row">';
html += '                              <label class="col-sm-2 control-label"><?php echo $entry_status; ?></label>';
html += '                              <div class="col-sm-2">';
html += '                                <select name="gixocaccount_groups_affiliate[' + groups_affiliate_row + '][status]" id="input-status" class="form-control">';
html += '                                  <option value="1"><?php echo $text_enabled; ?></option>';
html += '                                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>';
html += '                                </select>';
html += '                              </div>';
html += '                              <label class="col-sm-1 control-label"><?php echo $entry_font; ?></label>';
html += '                              <div class="col-sm-2">';
html += '                                <div class="input-group">';
html += '                                  <input type="text" name="gixocaccount_groups_affiliate[' + groups_affiliate_row + '][font]" value="27" placeholder="<?php echo $entry_font; ?>" id="input-font" class="form-control" />';
html += '                                  <span class="input-group-addon">px</span>';
html += '                                </div>';
html += '                              </div>';
html += '                              <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_info_font; ?>"><?php echo $entry_font_hover; ?></span></label>';
html += '                              <div class="col-sm-2">';
html += '                                <div class="input-group">';
html += '                                  <input type="text" name="gixocaccount_groups_affiliate[' + groups_affiliate_row + '][font_hover]" value="28" placeholder="<?php echo $entry_font_hover; ?>" id="input-font-hover" class="form-control" />';
html += '                                  <span class="input-group-addon">px</span>';
html += '                                </div>';
html += '                              </div>';
html += '                            </div>';
html += '                          </div>';
html += '                         </div>';

    $('#groups_affiliate').append(html);
    $([document.documentElement, document.body]).animate({
      scrollTop: $('#groups_affiliate-row' + groups_affiliate_row).offset().top
    }, 2000);
    groups_affiliate_row++;
}

var el_affiliate_row = <?php echo $el_affiliate_row; ?>;

function addEl_affiliate() {
html = '                         <div class="well" id="el_affiliate-row' + el_affiliate_row + '">';
html += '        <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger pull-right" onclick="confirm(\'<?php echo $text_confirm; ?>\') ? $(\'#el_affiliate-row' + el_affiliate_row + '\').remove() : false;"><i class="fa fa-trash-o"></i></button>';
html += '                          <input type="hidden" name="gixocaccount_el_affiliate[' + el_affiliate_row + '][id]" value="' + el_affiliate_row + '" id="input-id_el_affiliate' + el_affiliate_row + '" />';
html += '        <div class="form-group">';
html += '                            <div class="row">';
html += '         <label class="col-sm-2 control-label"><?php echo $entry_name; ?></label>';
html += '         <div class="col-sm-9">';
html += '        <?php foreach ($languages as $language) { ?>';
html += '                                <div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>';
html += '          <input type="text" name="gixocaccount_el_affiliate[' + el_affiliate_row + '][name][<?php echo $language['language_id']; ?>]" value="" placeholder="<?php echo $entry_name; ?>" class="form-control" />';
html += '        </div>';
html += '        <?php if (isset($error_name[$language['language_id']])) { ?>';
html += '        <div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>';
html += '        <?php } ?>';
html += '        <?php } ?>';
html += '                              </div>';
html += '       </div>';
html += '                          </div>';
html += '                          <div class="form-group">';
html += '                            <div class="row">';
html += '         <label class="col-sm-2 control-label"><?php echo $entry_group; ?></label>';
html += '         <div class="col-sm-5">';
html += '                                <select name="gixocaccount_el_affiliate[' + el_affiliate_row + '][affiliate_group_id]" id="input-gixocscd-group" class="form-control">';
html += '                                  <?php foreach ($gixocaccount_groups_affiliate as $affiliate_group) { ?>';
html += '                                  <option value="<?php echo $affiliate_group['id']; ?>"><?php echo $affiliate_group['name'][$language_id]; ?></option>';
html += '                                  <?php } ?>';
html += '                                </select>';
html += '                              </div>';
html += '         <label class="col-sm-2 control-label"><?php echo $entry_sort_order; ?></label>';
html += '         <div class="col-sm-2">';
html += '        <input type="text" name="gixocaccount_el_affiliate[' + el_affiliate_row + '][sort_order]" value="<?php echo $el['sort_order']; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />';
html += '                              </div>         ';
html += '       </div>';
html += '                          </div>';
html += '                          <div class="form-group">';
html += '                            <div class="row">';
html += '                              <label class="col-sm-2 control-label"><?php echo $entry_image; ?></label>';
html += '                              <div class="col-sm-2">';
html += '                                <a href="" id="thumb-image_el_affiliate' + el_affiliate_row + '" data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="gixocaccount_el_affiliate[' + el_affiliate_row + '][image]" value="<?php echo $placeholder; ?>" id="input-image_el_affiliate' + el_affiliate_row + '" />';                                
html += '                              </div>';
html += '                                <label class="col-sm-2 control-label"><?php echo $entry_image_description; ?></label>';
html += '                                <div class="col-sm-5">';
html += '                                  <div class="row">';
html += '                                    <div class="col-sm-6">';
html += '                                      <input type="text" name="gixocaccount_el_affiliate[' + el_affiliate_row + '][image_width]" value="64" placeholder="<?php echo $entry_width; ?>" class="form-control" />';
html += '                                    </div>';
html += '                                    <div class="col-sm-6">';
html += '                                      <input type="text" name="gixocaccount_el_affiliate[' + el_affiliate_row + '][image_height]" value="64" placeholder="<?php echo $entry_height; ?>" class="form-control" />';
html += '                                    </div>';
html += '                                  </div>';
html += '                                </div>';
html += '                            </div>';
html += '                          </div>';
html += '                          <div class="form-group">';
html += '                            <div class="row">';
html += '         <label class="col-sm-2 control-label"><?php echo $entry_class_el; ?></label>';
html += '         <div class="col-sm-5">';
html += '        <input type="text" name="gixocaccount_el_affiliate[' + el_affiliate_row + '][class_el]" value="col-lg-2 col-md-3 col-sm-4 col-xs-6 text-center" placeholder="<?php echo $entry_class_el; ?>" id="input-class-el" class="form-control" />';
html += '                              </div>';
html += '         <label class="col-sm-2 control-label"><?php echo $entry_color; ?></label>';
html += '         <div class="col-sm-2">';
html += '        <input type="text" name="gixocaccount_el_affiliate[' + el_affiliate_row + '][color]" value="#000000" placeholder="<?php echo $entry_color; ?>" id="input-color" size="6" class="color {required:false,hash:true} form-control" />';
html += '                              </div>';
html += '       </div>';
html += '                          </div>';
html += '                          <div class="form-group">';
html += '                            <div class="row">';
html += '         <label class="col-sm-2 control-label"><?php echo $entry_url; ?></label>';
html += '         <div class="col-sm-5">';
html += '        <div class="input-group">';
html += '                                  <span class="input-group-addon"><?php echo $domain; ?></span>';
html += '                                  <input type="text" name="gixocaccount_el_affiliate[' + el_affiliate_row + '][url]" value="" placeholder="<?php echo $entry_url; ?>" id="input-url" class="form-control" />';
html += '                                </div>';
html += '                              </div>';
html += '         <label class="col-sm-2 control-label"><?php echo $entry_color_hover; ?></label>';
html += '         <div class="col-sm-2">';
html += '        <input type="text" name="gixocaccount_el_affiliate[' + el_affiliate_row + '][color_hover]" value="#000000" placeholder="<?php echo $entry_color_hover; ?>" id="input-color-hover"  size="6" class="color {required:false,hash:true} form-control" />';
html += '                              </div>';
html += '       </div>';
html += '                          </div>';
html += '                          <div class="form-group">';
html += '                            <div class="row">';
html += '         <label class="col-sm-2 control-label"><?php echo $entry_status; ?></label>';
html += '         <div class="col-sm-2">';
html += '        <select name="gixocaccount_el_affiliate[' + el_affiliate_row + '][status]" id="input-status" class="form-control">';
html += '                                  <option value="1"><?php echo $text_enabled; ?></option>';
html += '                                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>';
html += '                                </select>';
html += '                              </div>';
html += '         <label class="col-sm-1 control-label"><?php echo $entry_font; ?></label>';
html += '         <div class="col-sm-2">';
html += '        <div class="input-group">';
html += '                                  <input type="text" name="gixocaccount_el_affiliate[' + el_affiliate_row + '][font]" value="14" placeholder="<?php echo $entry_font; ?>" id="input-font" class="form-control" />';
html += '                                  <span class="input-group-addon">px</span>';
html += '                                </div>';
html += '                              </div>';
html += '         <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_info_font; ?>"><?php echo $entry_font_hover; ?></span></label>';
html += '         <div class="col-sm-2">';
html += '        <div class="input-group">';
html += '                                  <input type="text" name="gixocaccount_el_affiliate[' + el_affiliate_row + '][font_hover]" value="15" placeholder="<?php echo $entry_font_hover; ?>" id="input-font-hover" class="form-control" />';
html += '                                  <span class="input-group-addon">px</span>';
html += '                                </div>';
html += '                              </div>';
html += '       </div>';
html += '                          </div>';
html += '       </div> ';

    $('#el_affiliate').append(html);
    $([document.documentElement, document.body]).animate({
      scrollTop: $('#el_affiliate-row' + el_affiliate_row).offset().top
    }, 2000);
    el_affiliate_row++;
}

var module_customer_row = <?php echo $module_customer_row; ?>;

function addModule_customer() {
html = '                         <div class="well" id="module_customer-row' + module_customer_row + '">';
html += '                          <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger pull-right" onclick="confirm(\'<?php echo $text_confirm; ?>\') ? $(\'#module_customer-row' + module_customer_row + '\').remove() : false;"><i class="fa fa-trash-o"></i></button>';
html += '                          <input type="hidden" name="gixocaccount_module_customer[' + module_customer_row + '][id]" value="' + module_customer_row + '" id="input-id_groups_customer' + module_customer_row + '" />';
html += '                          <div class="form-group">';
html += '                            <div class="row">';
html += '                              <label class="col-sm-2 control-label"><?php echo $entry_name; ?></label>';
html += '                              <div class="col-sm-9">';
html += '                                <?php foreach ($languages as $language) { ?>';
html += '                                <div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>';
html += '                                  <input type="text" name="gixocaccount_module_customer[' + module_customer_row + '][name][<?php echo $language['language_id']; ?>]" value="" placeholder="<?php echo $entry_name; ?>" class="form-control" />';
html += '                                </div>';
html += '                                <?php if (isset($error_name[$language['language_id']])) { ?>';
html += '                                <div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>';
html += '                                <?php } ?>';
html += '                                <?php } ?>';
html += '                              </div>';
html += '                            </div>';
html += '                          </div>';
html += '                          <div class="form-group">';
html += '                            <div class="row">';
html += '                              <label class="col-sm-2 control-label"><?php echo $entry_class_el; ?></label>';
html += '                              <div class="col-sm-3">';
html += '                                <input type="text" name="gixocaccount_module_customer[' + module_customer_row + '][class_el]" value="list-group-item" placeholder="<?php echo $entry_class_el; ?>" id="input-class-el" class="form-control" />';
html += '                              </div>';
html += '                              <label class="col-sm-1 control-label"><?php echo $entry_url; ?></label>';
html += '                              <div class="col-sm-5">';
html += '                                <div class="input-group">';
html += '                                  <span class="input-group-addon"><?php echo $domain; ?></span>';
html += '                                  <input type="text" name="gixocaccount_module_customer[' + module_customer_row + '][url]" value="" placeholder="<?php echo $entry_url; ?>" id="input-url" class="form-control" />';
html += '                                </div>';
html += '                              </div>';
html += '                            </div>';
html += '                          </div>';
html += '                          <div class="form-group">';
html += '                            <div class="row">';
html += '                             <label class="col-sm-2 control-label"><?php echo $entry_sort_order; ?></label>';
html += '                             <div class="col-sm-1">';
html += '                               <input type="text" name="gixocaccount_module_customer[' + module_customer_row + '][sort_order]" value="" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />';
html += '                             </div>';
html += '                             <label class="col-sm-2 control-label"><?php echo $entry_color; ?></label>';
html += '                             <div class="col-sm-2">';
html += '                               <input type="text" name="gixocaccount_module_customer[' + module_customer_row + '][color]" value="#000000" id="input-color" size="6" class="color {required:false,hash:true} form-control" />';
html += '                             </div>';
html += '                              <label class="col-sm-2 control-label"><?php echo $entry_color_hover; ?></label>';
html += '                              <div class="col-sm-2">';
html += '                                <input type="text" name="gixocaccount_module_customer[' + module_customer_row + '][color_hover]" value="#000000" placeholder="<?php echo $entry_color_hover; ?>" id="input-color-hover"  size="6" class="color {required:false,hash:true} form-control" />';
html += '                              </div>';
html += '                            </div>';
html += '                          </div>';
html += '                          <div class="form-group">';
html += '                            <div class="row">';
html += '                              <label class="col-sm-2 control-label"><?php echo $entry_status; ?></label>';
html += '                              <div class="col-sm-2">';
html += '                                <select name="gixocaccount_module_customer[' + module_customer_row + '][status]" id="input-status" class="form-control">';
html += '                                  <option value="1"><?php echo $text_enabled; ?></option>';
html += '                                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>';
html += '                                </select>';
html += '                              </div>';
html += '                              <label class="col-sm-1 control-label"><?php echo $entry_font; ?></label>';
html += '                              <div class="col-sm-2">';
html += '                                <div class="input-group">';
html += '                                  <input type="text" name="gixocaccount_module_customer[' + module_customer_row + '][font]" value="12" placeholder="<?php echo $entry_font; ?>" id="input-font" class="form-control" />';
html += '                                  <span class="input-group-addon">px</span>';
html += '                                </div>';
html += '                              </div>';
html += '                              <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_info_font; ?>"><?php echo $entry_font_hover; ?></span></label>';
html += '                              <div class="col-sm-2">';
html += '                                <div class="input-group">';
html += '                                  <input type="text" name="gixocaccount_module_customer[' + module_customer_row + '][font_hover]" value="14" placeholder="<?php echo $entry_font_hover; ?>" id="input-font-hover" class="form-control" />';
html += '                                  <span class="input-group-addon">px</span>';
html += '                                </div>';
html += '                              </div>';
html += '                            </div>';
html += '                          </div>';
html += '                         </div>';

    $('#module_customer').append(html);
    $([document.documentElement, document.body]).animate({
      scrollTop: $('#module_customer-row' + module_customer_row).offset().top
    }, 2000);
    module_customer_row++;
}

var module_affiliate_row = <?php echo $module_affiliate_row; ?>;

function addModule_affiliate() {
html = '                         <div class="well" id="module_affiliate-row' + module_affiliate_row + '">';
html += '                          <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger pull-right" onclick="confirm(\'<?php echo $text_confirm; ?>\') ? $(\'#module_affiliate-row' + module_affiliate_row + '\').remove() : false;"><i class="fa fa-trash-o"></i></button>';
html += '                          <input type="hidden" name="gixocaccount_module_affiliate[' + module_affiliate_row + '][id]" value="' + module_affiliate_row + '" id="input-id_groups_affiliate' + module_affiliate_row + '" />';
html += '                          <div class="form-group">';
html += '                            <div class="row">';
html += '                              <label class="col-sm-2 control-label"><?php echo $entry_name; ?></label>';
html += '                              <div class="col-sm-9">';
html += '                                <?php foreach ($languages as $language) { ?>';
html += '                                <div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>';
html += '                                  <input type="text" name="gixocaccount_module_affiliate[' + module_affiliate_row + '][name][<?php echo $language['language_id']; ?>]" value="" placeholder="<?php echo $entry_name; ?>" class="form-control" />';
html += '                                </div>';
html += '                                <?php if (isset($error_name[$language['language_id']])) { ?>';
html += '                                <div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>';
html += '                                <?php } ?>';
html += '                                <?php } ?>';
html += '                              </div>';
html += '                            </div>';
html += '                          </div>';
html += '                          <div class="form-group">';
html += '                            <div class="row">';
html += '                              <label class="col-sm-2 control-label"><?php echo $entry_class_el; ?></label>';
html += '                              <div class="col-sm-3">';
html += '                                <input type="text" name="gixocaccount_module_affiliate[' + module_affiliate_row + '][class_el]" value="list-group-item" placeholder="<?php echo $entry_class_el; ?>" id="input-class-el" class="form-control" />';
html += '                              </div>';
html += '                              <label class="col-sm-1 control-label"><?php echo $entry_url; ?></label>';
html += '                              <div class="col-sm-5">';
html += '                                <div class="input-group">';
html += '                                  <span class="input-group-addon"><?php echo $domain; ?></span>';
html += '                                  <input type="text" name="gixocaccount_module_affiliate[' + module_affiliate_row + '][url]" value="" placeholder="<?php echo $entry_url; ?>" id="input-url" class="form-control" />';
html += '                                </div>';
html += '                              </div>';
html += '                            </div>';
html += '                          </div>';
html += '                          <div class="form-group">';
html += '                            <div class="row">';
html += '                             <label class="col-sm-2 control-label"><?php echo $entry_sort_order; ?></label>';
html += '                             <div class="col-sm-1">';
html += '                               <input type="text" name="gixocaccount_module_affiliate[' + module_affiliate_row + '][sort_order]" value="" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />';
html += '                             </div>';
html += '                             <label class="col-sm-2 control-label"><?php echo $entry_color; ?></label>';
html += '                             <div class="col-sm-2">';
html += '                               <input type="text" name="gixocaccount_module_affiliate[' + module_affiliate_row + '][color]" value="#000000" id="input-color" size="6" class="color {required:false,hash:true} form-control" />';
html += '                             </div>';
html += '                              <label class="col-sm-2 control-label"><?php echo $entry_color_hover; ?></label>';
html += '                              <div class="col-sm-2">';
html += '                                <input type="text" name="gixocaccount_module_affiliate[' + module_affiliate_row + '][color_hover]" value="#000000" placeholder="<?php echo $entry_color_hover; ?>" id="input-color-hover"  size="6" class="color {required:false,hash:true} form-control" />';
html += '                              </div>';
html += '                            </div>';
html += '                          </div>';
html += '                          <div class="form-group">';
html += '                            <div class="row">';
html += '                              <label class="col-sm-2 control-label"><?php echo $entry_status; ?></label>';
html += '                              <div class="col-sm-2">';
html += '                                <select name="gixocaccount_module_affiliate[' + module_affiliate_row + '][status]" id="input-status" class="form-control">';
html += '                                  <option value="1"><?php echo $text_enabled; ?></option>';
html += '                                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>';
html += '                                </select>';
html += '                              </div>';
html += '                              <label class="col-sm-1 control-label"><?php echo $entry_font; ?></label>';
html += '                              <div class="col-sm-2">';
html += '                                <div class="input-group">';
html += '                                  <input type="text" name="gixocaccount_module_affiliate[' + module_affiliate_row + '][font]" value="12" placeholder="<?php echo $entry_font; ?>" id="input-font" class="form-control" />';
html += '                                  <span class="input-group-addon">px</span>';
html += '                                </div>';
html += '                              </div>';
html += '                              <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_info_font; ?>"><?php echo $entry_font_hover; ?></span></label>';
html += '                              <div class="col-sm-2">';
html += '                                <div class="input-group">';
html += '                                  <input type="text" name="gixocaccount_module_affiliate[' + module_affiliate_row + '][font_hover]" value="14" placeholder="<?php echo $entry_font_hover; ?>" id="input-font-hover" class="form-control" />';
html += '                                  <span class="input-group-addon">px</span>';
html += '                                </div>';
html += '                              </div>';
html += '                            </div>';
html += '                          </div>';
html += '                         </div>';

    $('#module_affiliate').append(html);
    $([document.documentElement, document.body]).animate({
      scrollTop: $('#module_affiliate-row' + module_affiliate_row).offset().top
    }, 2000);
    module_affiliate_row++;
}
//--></script>
<?php echo $footer; ?>