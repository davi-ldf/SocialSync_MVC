<?php 
namespace src\controllers;

use \core\Controller;
use \src\handlers\UserHandler;

class ConfigController extends Controller {
    
    private $loggedUser;

    public function __construct() {
        $this->loggedUser = UserHandler::checkLogin();
        if($this->loggedUser === false) {
            $this->redirect('/login');
        }
    }

    public function index() {
        $user = UserHandler::getUser(($this->loggedUser->id));

        $flash = '';
        if(!empty($_SESSION['flahs'])) {
            $flash = $_SESSION['flash'];
            $_SESSION['flash'] = '';
        }

        $this->render('settings', [
            'loggedUser' => $this->loggedUser,
            'user' => $user,
            'flash' => $flash
        ]);
    }

    public function save() {
        $name = filter_input(INPUT_POST, 'name');
        $birthdate = filter_input(INPUT_POST, 'birthdate');
        $email = filter_input(INPUT_POST, 'email');
        $city = filter_input(INPUT_POST, 'city');
        $work = filter_input(INPUT_POST, 'work');
        $password = filter_input(INPUT_POST, 'password');
        $passwordConfirm = filter_input(INPUT_POST, 'password_confirm');

        if($name && $email) {
            $updateFields = [];

            $user = UserHandler::getUser($this->loggedUser->id);

            //EMAIL
            if($user->email != $email) {
                if(!UserHandler::emailExists($email)) {
                    $updateFields['email'] = $email;
                } else {
                    $_SESSON['flash'] = 'E-mail já utilizado!';
                    $this->redirect('/config');
                }
            }

            //BIRTHDATE
            $birthdate = explode('/', $birthdate);
            if(count($birthdate) != 3) {
                $_SESsION['flash'] = 'Data de nascimento inválida!';
                $this->redirect('/config');
            }
            $birthdate = $birthdate[2].'-'.$birthdate[1].'-'.$birthdate[0];
            if(strtotime($birthdate) === false) {
                $_SESSION['flash'] = 'Data de nascimento inválida!';
                $this->redirect('/config');
            }
            $updateFields['birthdate'] = $birthdate;

            //PASSWORD
            if(!empty($password)) {
                if($password === $passwordConfirm) {
                    $updateFields['password'] = $password;
                } else {
                    $_SESSION['flash'] = 'As senhas não batem.';
                    $this->redirect('/config');
                }
            }

            //CAMPOS COMUNS
            $updateFields['name'] = $name;
            $updateFields['work'] = $work;
            $updateFields['city'] = $city;

            //AVATAR
            if(isset($_FILES['avatar']) && !empty($_FILES['avatar']['tmp_name'])) {
                $newAvatar = $_FILES['avatar'];

                if(in_array($newAvatar['type'], ['image/jpeg', 'image/jpg', 'image/png'])) {
                    $avatarName = $this->cutImage($newAvatar, 200, 200, 'media/avatars');
                    $updateFields['avatar'] = $avatarName;
                }
            }

            //COVER
            if(isset($_FILES['cover']) && !empty($_FILES['cover']['tmp_name'])) {
                $newCover = $_FILES['cover'];

                if(in_array($newCover['type'], ['image/jpeg', 'image/jpg', 'image/png'])) {
                    $coverName = $this->cutIamge($newCover, 850, 310, 'media/covers');
                    $updateFields['cover'] = $coverName;
                }
            }

            UserHandler::updateUser($updateFields, $this->loggedUser->id);

        }

        $this->redirect('/config');
    }

    private function cutImage($file, $w, $h, $folder) {
        list($widthOrig, $heightOrig) = getimagesize($file['tmp_name']);
        $ratio = $widthOrig / $heightOrig;

        if ($w / $h > $ratio) {
            $newWidth = $w;
            $newHeight = $w / $ratio;
        } else {
            $newHeight = $h;
            $newWidth = $h * $ratio;
        }

        $x = ($w - $newWidth) / 2;
        $y = ($h - $newHeight) / 2;

        $finalImage = imagecreatetruecolor($w, $h);

        switch($file['type']) {
            case 'image/jpeg':
            case 'image/jpg':
                $image = imagecreatefromjpeg($file['tmp_name']);
            break;
            case 'image/png':
                $image = imagecreatefrompng($file['tmp_name']);
            break;
                    
        }

        $backgroundColor = imagecolorallocate($finalImage, 255, 255, 255);
        imagefill($finalImage, 0, 0, $backgroundColor);

        imagecopyresampled(
            $finalImage, $image,
            $x, $y, 0, 0,
            $newWidth, $newHeight, $widthOrig, $heightOrig
        );

        $fileName = md5(time().rand(0, 9999)).'jpg';

        imagejpeg($finalImage, $folder.'/'.$fileName);

        return $fileName;
    }
}