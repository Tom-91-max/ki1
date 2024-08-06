@extends('master.main')

@section('main')
 <!-- main-area -->
 <main>
    <!-- breadcrumb-area -->
    <section class="breadcrumb-area tg-motion-effects breadcrumb-bg" data-background="uploads/bg/breadcrumb_bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-content">
                        <h2 class="title">Chang password</h2>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('home.index') }}">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Chang password</li>
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

        <div class="contact-wrap">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-6">
                        <div class="contact-content">
                            <div class="section-title mb-15">
                                <span class="sub-title">Chang your password</span>
                            </div>
                            <p>Meat provide well shaped fresh and the organic meat well <br> animals is Humans have hunted schistoric</p>
                            <form action="" method="POST">
                                @csrf
                                <div class="contact-form-wrap">

                                    <div class="form-grp">
                                        <input name="old_password" type="text" placeholder="Old password *" required>
                                        @error('old_password')
                                            <small class="help-block">{{ $message }}</small>
                                        @enderror
                                    </div>


                                    <div class="form-grp">
                                        <input name="password" type="text" placeholder="Your password *" required>
                                        @error('password')
                                            <small class="help-block">{{ $message }}</small>
                                        @enderror
                                    </div>

                                    <div class="form-grp">
                                        <input name="confirm_password" type="text" placeholder="Confirm password *" required>
                                        @error('conffirm_password')
                                            <small class="help-block">{{ $message }}</small>
                                        @enderror
                                    </div>

                                    <button type="submit">Login</button>
                                </div>
                            </form>
                            <p class="ajax-response mb-0"></p>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="contact-map">

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
