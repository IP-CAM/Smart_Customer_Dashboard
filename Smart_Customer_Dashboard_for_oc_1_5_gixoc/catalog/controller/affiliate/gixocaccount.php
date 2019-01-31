<?php
class ControllerAffiliateGixOCAccount extends Controller {
	public function index() {
		if (!$this->affiliate->isLogged()) {
	  		$this->session->data['redirect'] = $this->url->link('affiliate/account', '', 'SSL');
	  
	  		$this->redirect($this->url->link('affiliate/login', '', 'SSL'));
    	} 

		$status = $this->config->get('gixocaccount_status');
		if (!$status) {
			$this->redirect($this->url->link('affiliate/account', '', 'SSL'));
		}

		$this->language->load('affiliate/account');

      	$this->data['breadcrumbs'] = array();

      	$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
        	'separator' => false
      	); 

      	$this->data['breadcrumbs'][] = array(       	
        	'text'      => $this->language->get('text_account'),
			'href'      => $this->url->link('affiliate/account', '', 'SSL'),
        	'separator' => $this->language->get('text_separator')
      	);

		$this->document->setTitle($this->language->get('heading_title'));

    	$this->data['heading_title'] = $this->language->get('heading_title');

		if (isset($this->session->data['success'])) {
    		$this->data['success'] = $this->session->data['success'];
			
			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}

		//
		$groups = array();

		$this->load->model('tool/image');

		$language_id = $this->config->get('config_language_id');

		$groups = $this->config->get('gixocaccount_groups_affiliate');
		$els = $this->config->get('gixocaccount_el_affiliate');

		$els_css = '';

		foreach ($groups as $group) {
			if ($group['status']){
				foreach ($els as $el) {
					if (($el['status']) && ($el['affiliate_group_id'] == $group['id'])) {
						if (is_file(DIR_IMAGE . $el['image'])) {
							$image = $this->model_tool_image->resize($el['image'], $el['image_width'], $el['image_height']);
						} else {
							$image = $this->model_tool_image->resize('no_image.png', 64, 64);
						};

						$els_css .= '#el' . $el['id'] . '{color: ' . $el['color'] . '; font-size: ' . $el['font'] . 'px;}';
						$els_css .= '#el' . $el['id'] . ':hover{color: ' . $el['color_hover'] . '; font-size: ' . $el['font_hover'] . 'px;}';

						$names = $el['name'][$language_id];

						$sort_order = $el['sort_order'];

						$el_data[] = array(
							'name'        => $names,
							'id'          => 'el' . $el['id'],
							'url'         => $el['url'],
							'image'       => $image,
							'class_el'    => $el['class_el'],
							'sort_order'  => $el['sort_order']
						);
					}
				}

				$sort_order = array();

				foreach ($el_data as $key => $value) {
					$sort_order[$key] = $value['sort_order'];
				}

				array_multisort($sort_order, SORT_ASC, $el_data);

				$this->data['groups'][] = array(
					'id'                  => 'group' . $group['id'],
					'sort_order'          => $group['sort_order'],
					'name'                => $group['name'][$language_id],
					'class_el'            => $group['class_el'],
					'els'                 => $el_data
				);

				$els_css .= '#group' . $group['id'] . '{color: ' . $group['color'] . '; font-size: ' . $group['font'] . 'px;}';
				$els_css .= '#group' . $group['id'] . ':hover{color: ' . $group['color_hover'] . '; font-size: ' . $group['font_hover'] . 'px;}';
				
				$el_data = array();
			};
		};

		$sort_order = array();

		foreach ($this->data['groups'] as $key => $value) {
			$sort_order[$key] = $value['sort_order'];
		}

		array_multisort($sort_order, SORT_ASC, $this->data['groups']);

		$this->data['els_css'] = $els_css;
		//

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/gixocaccount.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/gixocaccount.tpl';
		} else {
			$this->template = 'default/template/module/gixocaccount.tpl';
		}

		$this->children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'common/footer',
			'common/header'	
		);
				
		$this->response->setOutput($this->render());		
	}
}
?>