defmodule AbulasarResumeWeb.HomePageLive do
  use AbulasarResumeWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <!-- Home Subpage -->
      <section class="pt-page pt-page-current" data-id="home">
        <div class="section-inner start-page-content">
          <div class="page-header">
            <div class="row">
              <div class="col-sm-4 col-md-4 col-lg-4">
                <div class="photo">
                  <img src="images/photo.png" alt="">
                </div>
              </div>

              <div class="col-sm-8 col-md-8 col-lg-8">
                <div class="title-block">
                  <h1>Abul Asar</h1>
                  <div class="owl-carousel text-rotation">
                    <div class="item">
                      <div class="sp-subtitle">Web Designer</div>
                    </div>
                    <div class="item">
                      <div class="sp-subtitle">Frontend-developer</div>
                    </div>
                  </div>
                </div>

                <div class="social-links">
                  <a href="#"><i class="fa fa-twitter"></i></a>
                  <a href="#"><i class="fa fa-facebook"></i></a>
                  <a href="#"><i class="fa fa-instagram"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="page-content">
            <div class="row">

              <div class="col-sm-6 col-md-6 col-lg-6">
                <div class="about-me">
                  <div class="block-title">
                    <h3>About <span>Me</span></h3>
                  </div>
                  <p>Hello! I’m Abul Asar. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean fermentum ullamcorper sem, at placerat dolor volutpat ac. Duis nulla enim, condimentum nec ultricies.</p>
                </div>
                <div class="download-resume">
                  <a href="" class="btn btn-secondary">Download Resume</a>
                </div>
              </div>

              <div class="col-sm-6 col-md-6 col-lg-6">
                <ul class="info-list">
                  <li><span class="title">Residence</span><span class="value">India</span></li>
                  <li><span class="title">Address</span><span class="value">Mumbai, India</span></li>
                  <li><span class="title">e-mail</span><span class="value"><a href="mailto:abul.asar22@gmail.com">abul.asar22@gmail.com</a></span></li>
                  <li><span class="title">Phone</span><span class="value">+91 7738279262</span></li>
                  <li><span class="title">Freelance</span><span class="value available">Available</span></li>
                </ul>
              </div>

            </div>
          </div>
        </div>
      </section>
      <!-- End of Home Subpage -->
    """
  end
end
