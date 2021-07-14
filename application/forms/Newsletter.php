<?php
class Application_Form_Newsletter extends Application_Form_Main
{
	public function __construct(array $params = array())
	{
	    parent::__construct();
	}

	/**
	 *
	 * Newsletter Form
	 *
	 */
	public function init()
	{
		$cname = explode('_', get_class()); $this->preInit(end($cname), true, false);

		// use template file
		$this->setDecorators( 
			array(
				array(
					'ViewScript'
					,array(
						'viewScript' => 'forms/Newsletter.phtml'
					)
				)
			) 
		);

        // Email
        $email =  $this->createElement('text', 'email');
        $email->addValidator('NotEmpty', true)
            ->addValidator(new Application_Validate_EmailAddress())
            ->setRequired(true)
            ->setAttrib('placeholder' , $this->translator->translate("Votre email") ) ;
        $email->getValidator('NotEmpty')->setMessage($this->translator->translate("votre saisir votre adresse email"));
	 	
		// submit button
		$submit = new Zend_Form_Element_Submit('submit');
		$submit
			->setDecorators(array('ViewHelper'))
			->setLabel($this->translator->translate("S'abonner"))
			->setAttrib('class', 'theme-btn') ;

		$this->addElements(
			array(
				$email, 
				$submit
			)
		);

		$elements = $this->getElements();
		foreach($elements as $element) {
		    $element->removeDecorator('DtDdWrapper')
		            ->removeDecorator('HtmlTag')
		            ->removeDecorator('Label');
		}
		
		$this->addElements(array());
		$this->postInit();
	}
}