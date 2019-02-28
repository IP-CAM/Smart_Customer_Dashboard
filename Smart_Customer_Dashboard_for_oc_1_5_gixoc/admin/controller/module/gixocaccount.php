<?php
class ControllerModuleGixOCAccount extends Controller {
	private $error = array();
	
	public function index() {
		$this->load->language('module/gixocaccount');

		$this->document->setTitle($this->language->get('text_title'));

		$this->load->model('setting/setting');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {						
			$this->model_setting_setting->editSetting('gixocaccount', $this->request->post);
			
			$this->session->data['success'] = $this->language->get('text_success');

			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_success'] = $this->language->get('text_success');
		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_yes'] = $this->language->get('text_yes');
		$this->data['text_no'] = $this->language->get('text_no');
		$this->data['text_css'] = $this->language->get('text_css');
		$this->data['text_other'] = $this->language->get('text_other');
		$this->data['text_test'] = $this->language->get('text_test');
		$this->data['text_confirm'] = $this->language->get('text_confirm');
		$this->data['text_browse'] = $this->language->get('text_browse');
		$this->data['text_clear'] = $this->language->get('text_clear');
		$this->data['text_image_manager'] = $this->language->get('text_image_manager');

		$this->data['button_el_add'] = $this->language->get('button_el_add');
		$this->data['button_groups_add'] = $this->language->get('button_groups_add');
		$this->data['button_delete'] = $this->language->get('button_delete');
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		
		$this->data['tab_design'] = $this->language->get('tab_design');
		$this->data['tab_customer'] = $this->language->get('tab_customer');
		$this->data['tab_affiliate'] = $this->language->get('tab_affiliate');
		$this->data['tab_module_customer'] = $this->language->get('tab_module_customer');
		$this->data['tab_module_affiliate'] = $this->language->get('tab_module_affiliate');

		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_css'] = $this->language->get('entry_css');
		$this->data['entry_back'] = $this->language->get('entry_back');
		$this->data['entry_el'] = $this->language->get('entry_el');
		$this->data['entry_groups'] = $this->language->get('entry_groups');
		$this->data['entry_group'] = $this->language->get('entry_group');
		$this->data['entry_name'] = $this->language->get('entry_name');
		$this->data['entry_width'] = $this->language->get('entry_width');
		$this->data['entry_height'] = $this->language->get('entry_height');
		$this->data['entry_image'] = $this->language->get('entry_image');
		$this->data['entry_image_description'] = $this->language->get('entry_image_description');
		$this->data['entry_url'] = $this->language->get('entry_url');
		$this->data['entry_class_el'] = $this->language->get('entry_class_el');
		$this->data['entry_color'] = $this->language->get('entry_color');
		$this->data['entry_color_hover'] = $this->language->get('entry_color_hover');
		$this->data['entry_font'] = $this->language->get('entry_font');
		$this->data['entry_font_hover'] = $this->language->get('entry_font_hover');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');

		$this->data['help_info_css'] = $this->language->get('help_info_css');
		$this->data['help_info_back'] = $this->language->get('help_info_back');
		$this->data['help_info_font'] = $this->language->get('help_info_font');

		$this->data['token'] = $this->session->data['token'];
				
		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		
		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
		);

		$this->data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_title'),
			'href' => $this->url->link('module/gixocaccount', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
		);

		$this->data['action'] = $this->url->link('module/gixocaccount', 'token=' . $this->session->data['token'], 'SSL');

		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->post['gixocaccount_status'])) {
			$this->data['gixocaccount_status'] = $this->request->post['gixocaccount_status'];
		}  else {
			$this->data['gixocaccount_status'] = $this->config->get('gixocaccount_status');
		}

		if (isset($this->request->post['gixocaccount_css'])) {
			$this->data['gixocaccount_css'] = $this->request->post['gixocaccount_css'];
		} else {
			$this->data['gixocaccount_css'] = $this->config->get('gixocaccount_css');
		}

		if (isset($this->request->post['gixocaccount_back'])) {
			$this->data['gixocaccount_back'] = $this->request->post['gixocaccount_back'];
		} else {
			$this->data['gixocaccount_back'] = $this->config->get('gixocaccount_back');
		}

		$this->load->model('localisation/language');

		$this->data['languages'] = $this->model_localisation_language->getLanguages();

		// Groups customer
		if (isset($this->request->post['gixocaccount_groups_customer'])) {
			$this->data['gixocaccount_groups_customer'] = $this->request->post['gixocaccount_groups_customer'];
		} else {
			$this->data['gixocaccount_groups_customer'] = $this->config->get('gixocaccount_groups_customer');
		}
		// End groups customer

		// El customer
		$this->load->model('tool/image');

		$this->data['placeholder'] = $this->model_tool_image->resize('no_image.png', 70, 70);
				
		if (isset($this->request->post['gixocaccount_el_customer'])) {
			$results = $this->request->post['gixocaccount_el_customer'];

			foreach ($results as $result) {
				if (is_file(DIR_IMAGE . $result['image'])) {
					$image = $result['image'];
					$thumb = $this->model_tool_image->resize($result['image'], 70, 70);
				} else {
					$image = 'no_image.png';
					$thumb = $this->model_tool_image->resize('no_image.png', 70, 70);
				};

				$this->data['gixocaccount_el_customer'][] = array(
					'customer_group_id'  => $result['customer_group_id'],
					'name'               => $result['name'],
					'sort_order'         => $result['sort_order'],
					'url'                => $result['url'],
					'image'              => $image,
					'image_width'        => $result['image_width'],
					'image_height'       => $result['image_height'],
					'thumb'              => $thumb,
					'class_el'           => $result['class_el'],
					'color'              => $result['color'],
					'color_hover'        => $result['color_hover'],
					'font'               => $result['font'],
					'font_hover'         => $result['font_hover'],
					'status'             => $result['status']
				);
			}
		} else {
			$results = $this->config->get('gixocaccount_el_customer');

			foreach ($results as $result) {
				if (is_file(DIR_IMAGE . $result['image'])) {
					$image = $result['image'];
					$thumb = $this->model_tool_image->resize($result['image'], 70, 70);
				} else {
					$image = 'no_image.png';
					$thumb = $this->model_tool_image->resize('no_image.png', 70, 70);
				};

				$this->data['gixocaccount_el_customer'][] = array(
					'customer_group_id'  => $result['customer_group_id'],
					'name'               => $result['name'],
					'sort_order'         => $result['sort_order'],
					'url'                => $result['url'],
					'image'              => $image,
					'image_width'        => $result['image_width'],
					'image_height'       => $result['image_height'],
					'thumb'              => $thumb,
					'class_el'           => $result['class_el'],
					'color'              => $result['color'],
					'color_hover'        => $result['color_hover'],
					'font'               => $result['font'],
					'font_hover'         => $result['font_hover'],
					'status'             => $result['status']
				);
			}
		}
		// End el customer

		// Groups affiliate		
		if (isset($this->request->post['gixocaccount_groups_affiliate'])) {
			$this->data['gixocaccount_groups_affiliate'] = $this->request->post['gixocaccount_groups_affiliate'];
		}  else {
			$this->data['gixocaccount_groups_affiliate'] = $this->config->get('gixocaccount_groups_affiliate');
		}
		// End groups affiliate
		
		// El affiliate
		if (isset($this->request->post['gixocaccount_el_affiliate'])) {
			$results = $this->request->post['gixocaccount_el_affiliate'];

			foreach ($results as $result) {
				if (is_file(DIR_IMAGE . $result['image'])) {
					$image = $result['image'];
					$thumb = $this->model_tool_image->resize($result['image'], 70, 70);
				} else {
					$image = 'no_image.png';
					$thumb = $this->model_tool_image->resize('no_image.png', 70, 70);
				};

				$this->data['gixocaccount_el_affiliate'][] = array(
					'affiliate_group_id' => $result['affiliate_group_id'],
					'name'               => $result['name'],
					'sort_order'         => $result['sort_order'],
					'url'                => $result['url'],
					'image'              => $image,
					'image_width'        => $result['image_width'],
					'image_height'       => $result['image_height'],
					'thumb'              => $thumb,
					'class_el'           => $result['class_el'],
					'color'              => $result['color'],
					'color_hover'        => $result['color_hover'],
					'font'               => $result['font'],
					'font_hover'         => $result['font_hover'],
					'status'             => $result['status']
				);
			}
		} else {
			$results = $this->config->get('gixocaccount_el_affiliate');

			foreach ($results as $result) {
				if (is_file(DIR_IMAGE . $result['image'])) {
					$image = $result['image'];
					$thumb = $this->model_tool_image->resize($result['image'], 70, 70);
				} else {
					$image = 'no_image.png';
					$thumb = $this->model_tool_image->resize('no_image.png', 70, 70);
				};

				$this->data['gixocaccount_el_affiliate'][] = array(
					'affiliate_group_id' => $result['affiliate_group_id'],
					'name'               => $result['name'],
					'sort_order'         => $result['sort_order'],
					'url'                => $result['url'],
					'image'              => $image,
					'image_width'        => $result['image_width'],
					'image_height'       => $result['image_height'],
					'thumb'              => $thumb,
					'class_el'           => $result['class_el'],
					'color'              => $result['color'],
					'color_hover'        => $result['color_hover'],
					'font'               => $result['font'],
					'font_hover'         => $result['font_hover'],
					'status'             => $result['status']
				);
			}
		}
		// End el affiliate

		if (isset($this->request->post['gixocaccount_module_customer'])) {
			$this->data['gixocaccount_module_customer'] = $this->request->post['gixocaccount_module_customer'];
		} else {
			$this->data['gixocaccount_module_customer'] = $this->config->get('gixocaccount_module_customer');
		}

		if (isset($this->request->post['gixocaccount_module_affiliate'])) {
			$this->data['gixocaccount_module_affiliate'] = $this->request->post['gixocaccount_module_affiliate'];
		} else {
			$this->data['gixocaccount_module_affiliate'] = $this->config->get('gixocaccount_module_affiliate');
		}

		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$this->data['domain'] = HTTPS_CATALOG;
		} else {
			$this->data['domain'] = HTTP_CATALOG;
		}		

		$this->data['no_image'] = $this->model_tool_image->resize('no_image.jpg', 70, 70);

		$this->data['language_id'] = $this->config->get('config_language_id');

		$this->template = 'module/gixocaccount.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
		
		$this->response->setOutput($this->render());
	}

	public function install(){
		$this->load->model('setting/setting');

		$gixocaccount_groups_customer = json_decode('[{"id":"0","name":{"1":"\u041c\u043e\u044f \u0443\u0447\u0435\u0442\u043d\u0430\u044f \u0437\u0430\u043f\u0438\u0441\u044c","2":"My Account"},"class_el":"h2","sort_order":"1","color":"#000000","color_hover":"#000000","status":"1","font":"27","font_hover":"28"},{"id":"1","name":{"1":"\u041c\u043e\u0438 \u0437\u0430\u043a\u0430\u0437\u044b","2":"My Orders"},"class_el":"h2","sort_order":"2","color":"#000000","color_hover":"#000000","status":"1","font":"27","font_hover":"28"},{"id":"2","name":{"1":"\u041f\u043e\u0434\u043f\u0438\u0441\u043a\u0430","2":"Newsletter"},"class_el":"h2","sort_order":"3","color":"#000000","color_hover":"#000000","status":"1","font":"27","font_hover":"28"}]', true);
		$gixocaccount_el_customer = json_decode('[{"id":"0","name":{"1":"\u0418\u0441\u0442\u043e\u0440\u0438\u044f \u0437\u0430\u043a\u0430\u0437\u043e\u0432","2":"View your order history"},"customer_group_id":"1","sort_order":"1","image":"catalog\/gixocscd\/skin1\/order.png","image_width":"64","image_height":"64","class_el":"el-center","color":"#000000","url":"index.php?route=account\/order","color_hover":"#000000","status":"1","font":"14","font_hover":"15"},{"id":"1","name":{"1":"\u0424\u0430\u0439\u043b\u044b \u0434\u043b\u044f \u0441\u043a\u0430\u0447\u0438\u0432\u0430\u043d\u0438\u044f","2":"Downloads"},"customer_group_id":"1","sort_order":"2","image":"catalog\/gixocscd\/skin1\/download.png","image_width":"64","image_height":"64","class_el":"el-center","color":"#000000","url":"index.php?route=account\/download","color_hover":"#000000","status":"1","font":"14","font_hover":"15"},{"id":"2","name":{"1":"\u0411\u043e\u043d\u0443\u0441\u043d\u044b\u0435 \u0431\u0430\u043b\u043b\u044b","2":"Your Reward Points"},"customer_group_id":"1","sort_order":"3","image":"catalog\/gixocscd\/skin1\/reward.png","image_width":"64","image_height":"64","class_el":"el-center","color":"#000000","url":"index.php?route=account\/reward","color_hover":"#000000","status":"1","font":"14","font_hover":"15"},{"id":"3","name":{"1":"\u0417\u0430\u044f\u0432\u043a\u0438 \u043d\u0430 \u0432\u043e\u0437\u0432\u0440\u0430\u0442","2":"View your return requests"},"customer_group_id":"1","sort_order":"4","image":"catalog\/gixocscd\/skin1\/return.png","image_width":"64","image_height":"64","class_el":"el-center","color":"#000000","url":"index.php?route=account\/return","color_hover":"#000000","status":"1","font":"14","font_hover":"15"},{"id":"4","name":{"1":"\u0418\u0441\u0442\u043e\u0440\u0438\u044f \u043f\u043b\u0430\u0442\u0435\u0436\u0435\u0439","2":"Your Transactions"},"customer_group_id":"1","sort_order":"5","image":"catalog\/gixocscd\/skin1\/transaction.png","image_width":"64","image_height":"64","class_el":"el-center","color":"#000000","url":"index.php?route=account\/transaction","color_hover":"#000000","status":"1","font":"14","font_hover":"15"},{"id":"5","name":{"1":"\u0420\u0435\u0433\u0443\u043b\u044f\u0440\u043d\u044b\u0435 \u043f\u043b\u0430\u0442\u0435\u0436\u0438","2":"Recurring payments"},"customer_group_id":"1","sort_order":"6","image":"catalog\/gixocscd\/skin1\/recurring.png","image_width":"64","image_height":"64","class_el":"el-center","color":"#000000","url":"index.php?route=account\/recurring","color_hover":"#000000","status":"1","font":"14","font_hover":"15"},{"id":"6","name":{"1":"\u041e\u0441\u043d\u043e\u0432\u043d\u044b\u0435 \u0434\u0430\u043d\u043d\u044b\u0435","2":"Edit your account information"},"customer_group_id":"0","sort_order":"1","image":"catalog\/gixocscd\/skin1\/edit.png","image_width":"64","image_height":"64","class_el":"el-center","color":"#000000","url":"index.php?route=account\/edit","color_hover":"#000000","status":"1","font":"14","font_hover":"15"},{"id":"7","name":{"1":"\u0418\u0437\u043c\u0435\u043d\u0438\u0442\u044c \u0441\u0432\u043e\u0439 \u043f\u0430\u0440\u043e\u043b\u044c","2":"Change your password"},"customer_group_id":"0","sort_order":"2","image":"catalog\/gixocscd\/skin1\/password.png","image_width":"64","image_height":"64","class_el":"el-center","color":"#000000","url":"index.php?route=account\/password","color_hover":"#000000","status":"1","font":"14","font_hover":"15"},{"id":"8","name":{"1":"\u0418\u0437\u043c\u0435\u043d\u0438\u0442\u044c \u043c\u043e\u0438 \u0430\u0434\u0440\u0435\u0441\u0430","2":"Modify your address book entries"},"customer_group_id":"0","sort_order":"3","image":"catalog\/gixocscd\/skin1\/address.png","image_width":"64","image_height":"64","class_el":"el-center","color":"#000000","url":"index.php?route=account\/address","color_hover":"#000000","status":"1","font":"14","font_hover":"15"},{"id":"9","name":{"1":"\u0418\u0437\u043c\u0435\u043d\u0438\u0442\u044c \u0437\u0430\u043a\u043b\u0430\u0434\u043a\u0438","2":"Modify your wish list"},"customer_group_id":"0","sort_order":"4","image":"catalog\/gixocscd\/skin1\/wishlist.png","image_width":"64","image_height":"64","class_el":"el-center","color":"#000000","url":"index.php?route=account\/wishlist","color_hover":"#000000","status":"1","font":"14","font_hover":"15"},{"id":"10","name":{"1":"\u0420\u0435\u0434\u0430\u043a\u0442\u0438\u0440\u043e\u0432\u0430\u0442\u044c \u043f\u043e\u0434\u043f\u0438\u0441\u043a\u0443","2":"Subscribe \/ unsubscribe to newsletter"},"customer_group_id":"2","sort_order":"1","image":"catalog\/gixocscd\/skin1\/newsletter.png","image_width":"64","image_height":"64","class_el":"el-center","color":"#000000","url":"index.php?route=account\/newsletter","color_hover":"#000000","status":"1","font":"14","font_hover":"15"}]', true);
		$gixocaccount_groups_affiliate = json_decode('[{"id":"0","name":{"1":"\u041c\u043e\u044f \u0443\u0447\u0435\u0442\u043d\u0430\u044f \u0437\u0430\u043f\u0438\u0441\u044c","2":"My Affiliate Account"},"class_el":"h2","sort_order":"1","color":"#000000","color_hover":"#000000","status":"1","font":"27","font_hover":"28"},{"id":"1","name":{"1":"\u041c\u043e\u0438 \u0440\u0435\u0444\u0435\u0440\u0430\u043b\u044b","2":"My Tracking Information"},"class_el":"h2","sort_order":"2","color":"#000000","color_hover":"#000000","status":"1","font":"27","font_hover":"28"},{"id":"2","name":{"1":"\u0418\u0441\u0442\u043e\u0440\u0438\u044f \u0432\u044b\u043f\u043b\u0430\u0442","2":"My Transactions"},"class_el":"h2","sort_order":"3","color":"#000000","color_hover":"#000000","status":"1","font":"27","font_hover":"28"}]', true);
		$gixocaccount_el_affiliate = json_decode('[{"id":"0","name":{"1":"\u0418\u0437\u043c\u0435\u043d\u0438\u0442\u044c \u0441\u0432\u043e\u0439 \u043f\u0430\u0440\u043e\u043b\u044c","2":"Change your password"},"affiliate_group_id":"0","sort_order":"2","image":"catalog\/gixocscd\/skin1\/password.png","image_width":"64","image_height":"64","class_el":"el-center","color":"#000000","url":"index.php?route=affiliate\/password","color_hover":"#000000","status":"1","font":"14","font_hover":"15"},{"id":"1","name":{"1":"\u041f\u043e\u0441\u043c\u043e\u0442\u0440\u0435\u0442\u044c \u0438\u0441\u0442\u043e\u0440\u0438\u044e \u0432\u044b\u043f\u043b\u0430\u0442","2":"View your transaction history"},"affiliate_group_id":"2","sort_order":"1","image":"catalog\/gixocscd\/skin1\/transaction.png","image_width":"64","image_height":"64","class_el":"el-center","color":"#000000","url":"index.php?route=affiliate\/transaction","color_hover":"#000000","status":"1","font":"14","font_hover":"15"},{"id":"2","name":{"1":"\u0420\u0435\u0444\u0435\u0440\u0430\u043b\u044c\u043d\u044b\u0439 \u043a\u043e\u0434","2":"Custom Affiliate Tracking Code"},"affiliate_group_id":"1","sort_order":"1","image":"catalog\/gixocscd\/skin1\/wishlist.png","image_width":"64","image_height":"64","class_el":"el-center","color":"#000000","url":"index.php?route=affiliate\/tracking","color_hover":"#000000","status":"1","font":"14","font_hover":"15"},{"id":"3","name":{"1":"\u041e\u0441\u043d\u043e\u0432\u043d\u044b\u0435 \u0434\u0430\u043d\u043d\u044b\u0435","2":"Edit your account information"},"affiliate_group_id":"0","sort_order":"1","image":"catalog\/gixocscd\/skin1\/edit.png","image_width":"64","image_height":"64","class_el":"el-center","color":"#000000","url":"index.php?route=affiliate\/edit","color_hover":"#000000","status":"1","font":"14","font_hover":"15"},{"id":"4","name":{"1":"\u0418\u0437\u043c\u0435\u043d\u0438\u0442\u044c \u043f\u043b\u0430\u0442\u0435\u0436\u043d\u044b\u0435 \u0440\u0435\u043a\u0432\u0438\u0437\u0438\u0442\u044b","2":"Change your payment preferences"},"affiliate_group_id":"0","sort_order":"3","image":"catalog\/gixocscd\/skin1\/address.png","image_width":"64","image_height":"64","class_el":"el-center","color":"#000000","url":"index.php?route=affiliate\/payment","color_hover":"#000000","status":"1","font":"14","font_hover":"15"}]', true);
		$gixocaccount_module_customer = json_decode('[{"id":"0","name":{"1":"\u041b\u0438\u0447\u043d\u044b\u0439 \u043a\u0430\u0431\u0438\u043d\u0435\u0442","2":"My Account"},"class_el":"list-group-item","url":"index.php?route=account\/account","sort_order":"1","color":"#000000","color_hover":"#000000","status":"1","font":"12","font_hover":"14"},{"id":"1","name":{"1":"\u0423\u0447\u0435\u0442\u043d\u0430\u044f \u0437\u0430\u043f\u0438\u0441\u044c","2":"Edit Account"},"class_el":"list-group-item","url":"index.php?route=account\/edit","sort_order":"2","color":"#000000","color_hover":"#000000","status":"1","font":"12","font_hover":"14"},{"id":"2","name":{"1":"\u0421\u043c\u0435\u043d\u0430 \u043f\u0430\u0440\u043e\u043b\u044f","2":"Password"},"class_el":"list-group-item","url":"index.php?route=account\/password","sort_order":"3","color":"#000000","color_hover":"#000000","status":"1","font":"12","font_hover":"14"},{"id":"3","name":{"1":"\u0410\u0434\u0440\u0435\u0441\u0430 \u0434\u043e\u0441\u0442\u0430\u0432\u043a\u0438","2":"Address Book"},"class_el":"list-group-item","url":"index.php?route=account\/address","sort_order":"4","color":"#000000","color_hover":"#000000","status":"1","font":"12","font_hover":"14"},{"id":"4","name":{"1":"\u041c\u043e\u0438 \u0437\u0430\u043a\u043b\u0430\u0434\u043a\u0438","2":"Wish List"},"class_el":"list-group-item","url":"index.php?route=account\/wishlist","sort_order":"5","color":"#000000","color_hover":"#000000","status":"1","font":"12","font_hover":"14"},{"id":"5","name":{"1":"\u0418\u0441\u0442\u043e\u0440\u0438\u044f \u0437\u0430\u043a\u0430\u0437\u043e\u0432","2":"Order History"},"class_el":"list-group-item","url":"index.php?route=account\/order","sort_order":"6","color":"#000000","color_hover":"#000000","status":"1","font":"12","font_hover":"14"},{"id":"6","name":{"1":"\u0424\u0430\u0439\u043b\u044b \u0434\u043b\u044f \u0441\u043a\u0430\u0447\u0438\u0432\u0430\u043d\u0438\u044f","2":"Downloads"},"class_el":"list-group-item","url":"index.php?route=account\/download","sort_order":"7","color":"#000000","color_hover":"#000000","status":"1","font":"12","font_hover":"14"},{"id":"7","name":{"1":"\u041f\u0435\u0440\u0438\u043e\u0434\u0438\u0447\u0435\u0441\u043a\u0438\u0435 \u043f\u043b\u0430\u0442\u0435\u0436\u0438","2":"Recurring payments"},"class_el":"list-group-item","url":"index.php?route=account\/recurring","sort_order":"8","color":"#000000","color_hover":"#000000","status":"1","font":"12","font_hover":"14"},{"id":"8","name":{"1":"\u0411\u043e\u043d\u0443\u0441\u043d\u044b\u0435 \u0431\u0430\u043b\u043b\u044b","2":"Reward Points"},"class_el":"list-group-item","url":"index.php?route=account\/reward","sort_order":"9","color":"#000000","color_hover":"#000000","status":"1","font":"12","font_hover":"14"},{"id":"9","name":{"1":"\u0412\u043e\u0437\u0432\u0440\u0430\u0442 \u0442\u043e\u0432\u0430\u0440\u0430","2":"Returns"},"class_el":"list-group-item","url":"index.php?route=account\/return","sort_order":"10","color":"#000000","color_hover":"#000000","status":"1","font":"12","font_hover":"14"},{"id":"10","name":{"1":"\u0418\u0441\u0442\u043e\u0440\u0438\u044f \u043f\u043b\u0430\u0442\u0435\u0436\u0435\u0439","2":"Transactions"},"class_el":"list-group-item","url":"index.php?route=account\/transaction","sort_order":"11","color":"#000000","color_hover":"#000000","status":"1","font":"12","font_hover":"14"},{"id":"11","name":{"1":"\u041f\u043e\u0434\u043f\u0438\u0441\u043a\u0430 \u043d\u0430 \u043d\u043e\u0432\u043e\u0441\u0442\u0438","2":"Newsletter"},"class_el":"list-group-item","url":"index.php?route=account\/newsletter","sort_order":"12","color":"#000000","color_hover":"#000000","status":"1","font":"12","font_hover":"14"},{"id":"12","name":{"1":"\u0412\u044b\u0439\u0442\u0438","2":"Logout"},"class_el":"list-group-item","url":"index.php?route=account\/logout","sort_order":"13","color":"#000000","color_hover":"#000000","status":"1","font":"12","font_hover":"14"}]', true);
		$gixocaccount_module_affiliate = json_decode('[{"id":"0","name":{"1":"\u041b\u0438\u0447\u043d\u044b\u0439 \u043a\u0430\u0431\u0438\u043d\u0435\u0442","2":"My Account"},"class_el":"list-group-item","url":"index.php?route=affiliate\/account","sort_order":"1","color":"#000000","color_hover":"#000000","status":"1","font":"12","font_hover":"14"},{"id":"1","name":{"1":"\u0423\u0447\u0435\u0442\u043d\u0430\u044f \u0437\u0430\u043f\u0438\u0441\u044c","2":"Edit Account"},"class_el":"list-group-item","url":"index.php?route=affiliate\/edit","sort_order":"2","color":"#000000","color_hover":"#000000","status":"1","font":"12","font_hover":"14"},{"id":"2","name":{"1":"\u0421\u043c\u0435\u043d\u0430 \u043f\u0430\u0440\u043e\u043b\u044f","2":"Password"},"class_el":"list-group-item","url":"index.php?route=affiliate\/password","sort_order":"3","color":"#000000","color_hover":"#000000","status":"1","font":"12","font_hover":"14"},{"id":"3","name":{"1":"\u0421\u043f\u043e\u0441\u043e\u0431 \u043e\u043f\u043b\u0430\u0442\u044b","2":"Payment Options"},"class_el":"list-group-item","url":"index.php?route=affiliate\/payment","sort_order":"4","color":"#000000","color_hover":"#000000","status":"1","font":"12","font_hover":"14"},{"id":"4","name":{"1":"\u0420\u0435\u0444\u0435\u0440\u0430\u043b\u044b","2":"Affiliate Tracking"},"class_el":"list-group-item","url":"index.php?route=affiliate\/tracking","sort_order":"5","color":"#000000","color_hover":"#000000","status":"1","font":"12","font_hover":"14"},{"id":"5","name":{"1":"\u0418\u0441\u0442\u043e\u0440\u0438\u044f \u0432\u044b\u043f\u043b\u0430\u0442","2":"Transactions"},"class_el":"list-group-item","url":"index.php?route=affiliate\/transaction","sort_order":"6","color":"#000000","color_hover":"#000000","status":"1","font":"12","font_hover":"14"},{"id":"6","name":{"1":"\u0412\u044b\u0439\u0442\u0438","2":"Logout"},"class_el":"list-group-item","url":"index.php?route=affiliate\/logout","sort_order":"7","color":"#000000","color_hover":"#000000","status":"1","font":"12","font_hover":"14"}]', true);

		$setting = array(
			'gixocaccount_status'           => 0,
			'gixocaccount_css'              => '.list-unstyled{width:100%;overflow:auto;text-align:left}
.el-center{width:25%;display:inline-block;vertical-align:top;text-align:center;margin:10px}
a{text-decoration:none}',
			'gixocaccount_back'             => 0,
			'gixocaccount_groups_customer'  => $gixocaccount_groups_customer,
			'gixocaccount_el_customer'      => $gixocaccount_el_customer,
			'gixocaccount_groups_affiliate' => $gixocaccount_groups_affiliate,
			'gixocaccount_el_affiliate'     => $gixocaccount_el_affiliate,
			'gixocaccount_module_customer'  => $gixocaccount_module_customer,
			'gixocaccount_module_affiliate' => $gixocaccount_module_affiliate
		);
		$this->model_setting_setting->editSetting('gixocaccount', $setting, 0);
	}

	public function uninstall(){
		$this->load->model('setting/setting');
		$this->model_setting_setting->deleteSetting('gixocaccount');
	}
	
	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/gixocaccount')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	} 
}