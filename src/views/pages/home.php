<?=$render('header');?>
<section class="container main">
        <?= $render('sidebar'); ?>
        <section class="feed mt-10">
            
            <div class="row">
                <div class="column pr-5">

                    <div class="box feed-new">
                        <div class="box-body">
                            <div class="feed-new-editor m-10 row">
                                <div class="feed-new-avatar">
                                    <img src="media/avatars/avatar.jpg" />
                                </div>
                                <div class="feed-new-input-placeholder">O que você está pensando, Davi?</div>
                                <div class="feed-new-input" contenteditable="true"></div>
                                <div class="feed-new-send">
                                    <img src="assets/images/send.png" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="box feed-item">
                        <div class="box-body">
                            <div class="feed-item-head row mt-20 m-width-20">
                                <div class="feed-item-head-photo">
                                    <a href=""><img src="media/avatars/avatar.jpg" /></a>
                                </div>
                                <div class="feed-item-head-info">
                                    <a href=""><span class="fidi-name">Davi Lisboa</span></a>
                                    <span class="fidi-action">fez um post</span>
                                    <br/>
                                    <span class="fidi-date">07/03/2020</span>
                                </div>
                                <div class="feed-item-head-btn">
                                    <img src="assets/images/more.png" />
                                </div>
                            </div>
                            <div class="feed-item-body mt-10 m-width-20">
                                Olá, visitante! Seja bem-vindo à SocialSync. <br> Esta é uma plataforma desenvolvida aos moldes do famoso Facebook.<br/><br/>
                                Por aqui você pode interagir com publicações, personalizar seu perfil, seguir outros perfis e muito mais.<br/><br/>
                                Não se esqueça de conferir a documentação completa no repositório do GitHub, onde eu informo mais detalhes sobre o funcionamento deste projeto!
                            </div>
                            <div class="feed-item-buttons row mt-20 m-width-20">
                                <div class="like-btn on">56</div>
                                <div class="msg-btn">3</div>
                            </div>
                            <div class="feed-item-comments">
                                
                                <div class="fic-item row m-height-10 m-width-20">
                                    <div class="fic-item-photo">
                                        <a href=""><img src="media/avatars/avatar.jpg" /></a>
                                    </div>
                                    <div class="fic-item-info">
                                        <a href="">Davi Lisboa</a>
                                        Comentando no meu próprio post
                                    </div>
                                </div>

                                <div class="fic-item row m-height-10 m-width-20">
                                    <div class="fic-item-photo">
                                        <a href=""><img src="media/avatars/avatar.jpg" /></a>
                                    </div>
                                    <div class="fic-item-info">
                                        <a href="">Davi Lisboa</a>
                                        Muito legal, parabéns!
                                    </div>
                                </div>

                                <div class="fic-answer row m-height-10 m-width-20">
                                    <div class="fic-item-photo">
                                        <a href=""><img src="media/avatars/avatar.jpg" /></a>
                                    </div>
                                    <input type="text" class="fic-item-field" placeholder="Escreva um comentário" />
                                </div>

                            </div>
                        </div>
                    </div>

                    

                </div>
                <div class="column side pl-5">
                    <div class="box banners">
                        <div class="box-header">
                            <div class="box-header-text">Patrocínios</div>
                            <div class="box-header-buttons">
                                
                            </div>
                        </div>
                        <div class="box-body">
                            <a href=""><img src="media/courses/php-nivel-1.png" /></a>
                            <a href=""><img src="media/courses/mysql-nivel-1.jpg" /></a>
                        </div>
                    </div>
                    <div class="box">
                        <div class="box-body m-10">
                            Todos os direitos reservados
                        </div>
                    </div>
                </div>
            </div>

        </section>
    </section>
<?=$render('footer');?>