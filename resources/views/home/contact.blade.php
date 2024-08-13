@extends('master.main')

@section('main')

<!-- main-area -->
<main>

<!-- breadcrumb-area -->
<section class="breadcrumb-area tg-motion-effects breadcrumb-bg" data-background="assets/img/bg/breadcrumb_bg.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb-content">
                    <h2 class="title">Contact us</h2>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{ route('home.index') }}">Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Contact us</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- breadcrumb-area-end -->

<!-- contact-area -->
<section class="contact-area">
    <div class="contact-info-wrap contact-info-bg" data-background="assets/img/bg/contact_info_bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="contact-info-item">
                        <div class="icon">
                            <i class="flaticon-call"></i>
                        </div>
                        <div class="content">
                            <h4 class="title">Phone</h4>
                            <span>+0 333 999 8899</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="contact-info-item">
                        <div class="icon">
                            <i class="flaticon-email"></i>
                        </div>
                        <div class="content">
                            <h4 class="title">Email</h4>
                            <span>info@yourmail.com</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="contact-info-item">
                        <div class="icon">
                            <i class="flaticon-location"></i>
                        </div>
                        <div class="content">
                            <h4 class="title">Address</h4>
                            <span>W33 Park, New York</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="contact-info-item">
                        <div class="icon">
                            <i class="flaticon-location-1"></i>
                        </div>
                        <div class="content">
                            <h4 class="title">HeadOffice</h4>
                            <span>W33 Park, New York</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="contact-wrap">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6">
                    <div class="contact-content">
                        <div class="section-title mb-15">
                            <span class="sub-title">Experien</span>
                            <h2 class="title">Get in <span>Touch</span></h2>
                        </div>
                        <p>Meat provide well shaped fresh and the organic meat well <br> animals is Humans have hunted schistoric</p>
                        <form id="contact-form" action="https://themegenix.net/html/bemet/assets/mail.php" method="POST">
                            <div class="contact-form-wrap">
                                <div class="form-grp">
                                    <input name="name" type="text" placeholder="Your Name *" required>
                                </div>
                                <div class="form-grp">
                                    <input name="email" type="email" placeholder="Your Email *" required>
                                </div>
                                <div class="form-grp">
                                    <input name="subject" type="text" placeholder="Your Subject *" required>
                                </div>
                                <div class="form-grp">
                                    <textarea name="message" placeholder="Message"></textarea>
                                </div>
                                <button type="submit">Send Message</button>
                            </div>
                        </form>
                        <p class="ajax-response mb-0"></p>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="contact-map">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d96811.54759587669!2d-74.01263924803828!3d406880494567041!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c25bae694479a3%3A0xb9949385da52e69e!2sBarclays%20Center!5e0!3m2!1sen!2sbd!4v1636195194646!5m2!1sen!2sbd" allowfullscreen loading="lazy"></iframe>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- contact-area-end -->

</main>
<!-- main-area-end -->
@stop()
