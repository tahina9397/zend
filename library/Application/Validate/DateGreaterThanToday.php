<?php

class Application_Validate_DateGreaterThanToday extends Zend_Validate_Abstract
{
    const DATE_INVALID = 'dateInvalid';

    protected $_messageTemplates = array(
        // self::DATE_INVALID => "'%value%' is not greater than or equal today"
        self::DATE_INVALID => "impossible de faire une réservation dans le passé "
    );

    public function isValid($value)
    {
        $this->_setValue($value);

        $today = date('Y-m-d');

        // expecting $value to be YYYY-MM-DD
        if ($value < $today) {
            $this->_error(self::DATE_INVALID);
            return false;
        }

        return true;
    }
}