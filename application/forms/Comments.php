<?php
class Application_Form_Comments extends Application_Form_Main
{
    private $_id_new;

	public function __construct(array $params = array())
	{
        $this->_id_new = $params['id_new'];
	    parent::__construct();
	}

	/**
	 *
	 * Signin form
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
						'viewScript' => 'forms/Comments.phtml'
                        ,'id_new' => $this->_id_new
					)
				)
			) 
		);

		$name =  $this->createElement('text', 'name');
		$name->addValidator('NotEmpty', true)
		    ->setRequired(true) ;
		$name->getValidator('NotEmpty')->setMessage($this->translator->translate("le champ nom est obligatoire"));

        $email =  $this->createElement('text', 'email');
        $email->addValidator('NotEmpty', true)
            ->addValidator(new Application_Validate_EmailAddress())
            ->setRequired(true) ;
		$email->getValidator('NotEmpty')->setMessage($this->translator->translate("le champ email est obligatoire"));

	 	// Message
        $commentaire = new Zend_Form_Element_Textarea('commentaire');
        $commentaire->addFilter('StripTags')
                ->addValidator('NotEmpty', true)
                ->setRequired(true)
        		->setAttrib('ROWS' ,"7") ;
        $commentaire->getValidator('NotEmpty')->setMessage($this->translator->translate("veuillez laisser un commentaire"));
		
		// submit button
		$submit = new Zend_Form_Element_Submit('submit');

		$this->addElements(
			array(
				$name, 
				$email, 
				$commentaire, 
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