<?php
class ControllerCommonHome extends Controller {
	public function index() {
		$this->document->setTitle($this->config->get('config_meta_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));

    $this->document->addScript('https://cdnjs.cloudflare.com/ajax/libs/gsap/latest/TweenLite.min.js');
		$this->document->addScript('https://cdnjs.cloudflare.com/ajax/libs/gsap/latest/plugins/CSSPlugin.min.js');
    $this->document->addScript('catalog/view/theme/BlampStore/js/owl.carousel.min.js');
		$this->document->addScript('catalog/view/theme/BlampStore/js/header_carusel.js');

		$this->document->addStyle('catalog/view/theme/BlampStore/stylesheet/owlcarousel/owl.carousel.min.css');
		$this->document->addStyle('catalog/view/theme/BlampStore/stylesheet/owlcarousel/owl.theme.default.min.css');
		$this->document->addStyle('catalog/view/theme/BlampStore/stylesheet/owlcarousel/animate.css');
		if (isset($this->request->get['route'])) {
			$this->document->addLink($this->config->get('config_url'), 'canonical');
		}

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('common/home', $data));
	}
}
