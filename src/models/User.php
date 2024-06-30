<?php
namespace src\models;
use \core\Model;

class User extends Model {
    public $id;
    public $name;
    public $avatar;
    public $birthdate;
    public $ageYears;
    public $city;
    public $work;
    public $cover;
    public $followers = [];
    public $following = [];
    public $photos = [];

}