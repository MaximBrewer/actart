import React from 'react';
import { useAuth } from '../context/auth';
import __ from '../utils/trans';
import Marquee from '../components/marquee'
import useDocumentTitle from '../components/document-title';
import Parser from "html-react-parser";
import Auctions from "../components/auction/Auctions";
import MovingGallery from "../components/moving/Gallery";
import Carousel from "../components/carousel/Carousel";
import WaterfallAjax from "../components/waterfall/WaterfallAjax";



function Home() {
  useDocumentTitle(__('HOME_TITLE'));
  let { currentUser } = useAuth();
  const participate = () => { }

  return (
    <React.Fragment>
      <section className="home-banner">
        <div className="sticky-wrapper">
          <div className="container">
            <div className="h5 d-xl-none">{Parser(__('AUCTIONS_BLOCK_TITLE'))}</div>
            <Auctions participate={participate} />
          </div>
          <div className="sticky-section"><span>{__('AUCTIONS_BLOCK_STICKY')}</span></div>
        </div>
      </section>
      <Marquee />
      <section className="gallery-section">
        <div className="sticky-wrapper">
          <div className="container">
            <div className="row announce">
              <div className="col col-md-40 offset-md-20 col-xl-45 offset-xl-15">
                <h2 className="h1">{__('GALLERY_BLOCK_TITLE')}</h2>
                <div className="sub_h2 d-none d-xl-block">
                  {__('GALLERY_BLOCK_INTROTEXT')}
                </div>
                <a href="/how-to-buy" className="link-how-to-buy">{__('GALLERY_BLOCK_HOW_TO_BUY_LINK')}?</a>
              </div>
            </div>
            <div className="art-waterfall-wrapper">
              <h3 className="d-none d-md-block pb-4">
                {__("GALLERY_BLOCK_LATEST_BIDS")}:
                        <svg className="hummer" width="42" height="42" viewBox="0 0 42 42" fill="none"
                  xmlns="http://www.w3.org/2000/svg">
                  <rect x="25.1066" width="23.6707" height="11.8354" rx="1" transform="rotate(45 25.1066 0)"
                    fill="#FF665E" />
                  <rect x="21.7591" y="16.7378" width="4.73415" height="18.9366"
                    transform="rotate(45 21.7591 16.7378)" fill="#FF665E" />
                </svg>
              </h3>
              <div className="act-waterfall">
                <WaterfallAjax data={{
                  entity: "lots",
                  action: "none",
                  lastbets: "true",
                  limit: { "xs": 6, "sm": 6, "md": 12, "lg": 12, "xl": 24, "xxl": 24 },
                  view: { "xs": 1, "sm": 2, "md": 2, "lg": 3, "xl": 3, "xxl": 4 },
                  scroll: { "xs": 1, "sm": 1, "md": 2, "lg": 3, "xl": 4, "xxl": 4 },
                  tizerView: "lastbets"
                }} />
              </div>
              <div className="show-more">
                <div className="dots">•••</div>
                <a href="/gallery" className="text">{__('GALLERY_BLOCK_SHOW_MORE_LINK')}</a>
              </div>
            </div>
          </div>
          <div className="sticky-section"><span>{__('GALLERY_BLOCK_STICKY')}</span></div>
        </div>
      </section>
      <section className="d-none d-md-block popular-categories-section">
        <div className="container">
          <div className="popular-categories">
            <h4 className="h4">{__('Popular Categories')}</h4>
            <div className="d-flex justify-content-between categories">
              @widget('popular_categories')
                </div>
            <div className="d-flex justify-content-center align-items-end">
              <a href="/gallery" className="btn btn-default">{__('VIEW ALL WORKS')}</a>
            </div>
          </div>
        </div>
      </section>

      <section id="homeAbout">
        <div className="background-text">
          @include('svg.home.about-logo')
        </div>
        <div className="sticky-wrapper">
          <div className="dotted-bg"></div>
          <div className="background-logo">
            @include('svg.home.about-bg-logo')
            </div>
          <div className="container">
            <div className="row">
              <div className="col-xl-20">
              </div>
              <div className="col-xl-40">
                <h2 className="h2">{__('О ПЛАТФОРМЕ')}</h2>
                <hr />
                <p className="sub_h2">Платформа Act-Art – независимый социально-ориентированный коммерческий проект.
                Наша
                цель – популяризация современного российского искуства в России и мире. Мы помогаем молодым и
                именитым авторам найти своего зрителя и ценителя, делая процесс приобретения произведений
                            максимально удобным и демократичным.</p>
                <p className="sub_h2">Являясь куратором возрождённого легендарного творческого объединения
                “ВсекоХудожник”,
                платформа Аct-Art эксклюзивно представляет лучшие работы его авторов. Часть вырученных на
                аукционах
                средств идёт на обеспечение и развитие мастерских, выставок, поддержку творческих проектов,
                            образовательные инициативы для горожан.</p>
                <ul className="list-unstyled d-md-flex justify-content-between">
                  <li className="h5 h5_underline"><a href="/about">Подробнее о&nbsp;платформе</a></li>
                  <li className="h5 h5_underline"><a href="/spaces#exhibitions">Выставочные пространства</a></li>
                  <li className="h5 h5_underline"><a href="/spaces#workshops">Мастерские «ВсекоХудожник»</a></li>
                </ul>
              </div>
            </div>
            <div className="rolling-strings d-none">
              <div className="row">
                <div className="col col-md-50 align-self-end">
                  <div className="d-flex" style={{ transform: "translateX(40%)" }}>
                    <div className="h7">образование</div>
                    <div className="h7">поддержка</div>
                    <div className="h7">поддержка</div>
                  </div>
                  <div className="d-flex" style={{ transform: "translateX(30%)" }}>
                    <div className="h7">искусство</div>
                    <div className="h7">ОБЩЕСТВО</div>
                    <div className="h7">словослово</div>
                  </div>
                  <div className="d-flex" style={{ transform: "translateX(55%)" }}>
                    <div className="h7">ОТВЕТСТВЕННОСТЬ</div>
                    <div className="h7">просвещение</div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div className="sticky-section"><span>{__('о проекте')}</span></div>
        </div>
      </section>
      <Marquee />
      <section id="announces">
        <div className="sticky-wrapper">
          <div className="container">
            <div className="row announce">
              <div className="col-xl-40 col-xxl-38">
                <h2 className="h2">ВЫСТАВКИ <span>и</span>&nbsp;МАСТЕРСКИЕ</h2>
                <p className="sub_h2 d-none d-xl-block">Платформа Акт-Арт представляет три творческих кластера с
                собственными творческими
                мастерскими и выставочными галереями.
                            Все кластеры находятся в историческом центре Москвы и далее какой-то текст.</p>
                <p className="sub_h2 d-none d-xl-block">Все кластеры находятся в историческом центре Москвы и далее
                какой-то
                текст. Все
                            кластеры находятся в историческом центре Москвы и далее какой-то текст.</p>
              </div>
              <div className="col-xl-20 col-xxl-22 d-none d-xl-block">
                <h3 className="h3">Адреса:</h3>
                <dl>
                  <dt>Акт-Арт Фрунзенская</dt>
                  <dd>Фрунзенская набережная, 1</dd>
                  <dt>Акт-Арт Пречистенка</dt>
                  <dd>Пречистенка, 24</dd>
                  <dt>Акт-Арт Солянка</dt>
                  <dd>Пречистенка, 24</dd>
                </dl>
              </div>
            </div>
            <div className="announce-slider-wrapper">
              <div className="announce-slider act-carousel" id="announceSlider">
                <Carousel  items={App.events} data={{
                  entity: "events",
                  limit: { "xs": 4, "sm": 4, "md": 4, "lg": 12, "xl": 24, "xxl": 24 },
                  view: { "xs": 1, "sm": 1, "md": 2, "lg": 3, "xl": 4, "xxl": 4 },
                  scroll: { "xs": 1, "sm": 1, "md": 2, "lg": 3, "xl": 4, "xxl": 4 },
                  tizerView: "event",
                  minView: "md"
                }} />
              </div>
            </div>
          </div>
          <div className="sticky-section"><span>анонсы мероприятий</span></div>
        </div>
      </section>
      <section id="gallery"><MovingGallery /></section>
      <section id="news">
        <div className="background-text">НОВОСТИ</div>
        <div className="sticky-wrapper">
          <div className="container">
            <div className="h5 d-xl-none">БЛОГ И НОВОСТИ</div>
            <div className="news-slider-wrapper">
              <div className="news-slider act-carousel" id="newsSlider" >
                <Carousel  items={App.posts} data={{
                  entity: "posts",
                  limit: { xs: 6, sm: 6, md: 12, lg: 12, xl: 24, xxl: 24 },
                  view: { xs: 1, sm: 1, md: 3, lg: 3, xl: 4, xxl: 4 },
                  scroll: { xs: 1, sm: 1, md: 3, lg: 3, xl: 4, xxl: 4 },
                  tizerView: "post",
                  minView: "sm"
                }} />
              </div>
            </div>
          </div>
          <div className="sticky-section"><span>последние заметки</span></div>
        </div>
      </section>
      <section id="experts" className="d-none d-sm-none d-md-block">
        <div>
          <div className="sticky-wrapper">
            <div className="container">
              <h2 className="h2">ЭКСПЕРТНЫЙ СОВЕТ</h2>
              <div className="experts-slider-wrapper">
                <div className="experts-slider act-carousel" id="expertsSlider" >
                  <Carousel items={App.experts} data={{
                    entity: "experts",
                    limit: { "xs": 96, "sm": 96, "md": 96, "lg": 96, "xl": 96, "xxl": 96 },
                    view: { "xs": 1, "sm": 1, "md": 3, "lg": 4, "xl": 6, "xxl": 6 },
                    scroll: { "xs": 1, "sm": 1, "md": 3, "lg": 4, "xl": 6, "xxl": 6 },
                    tizerView: "expert",
                    minView: "sm"
                  }} />
                </div>
              </div>
            </div>
            <div className="sticky-section"><span>экспертный совет</span></div>
          </div>
        </div>
      </section>
      <section className="mb-5">
        <div className="container mb-5">
          <div className="footer-buttons">
            <a href="/auctions" className="btn btn-default">
              {__("Смотреть аукционы")}
            </a>
            <a href="/gallery" className="btn btn-primary">
              {__("To Gallery")}
            </a>
          </div>
        </div>
      </section>
      <Marquee />
    </React.Fragment>
  );
}

export default Home;
