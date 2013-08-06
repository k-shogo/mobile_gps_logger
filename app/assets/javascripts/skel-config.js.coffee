window._skel_config=
  prefix: "/assets/style"
  resetCSS: true
  boxModel: "border"
  grid:
    gutters: 30

  breakpoints:
    wide:
      range: "1200-"
      containers: 1140
      hasStyleSheet: false
      grid:
        gutters: 50

    mobile:
      range: "-640"
      viewportWidth: 640
      containers: "fluid"
      grid:
        collapse: true

window._skel_panels_config =
  panels:
    leftPanel:
      breakpoints: "mobile"
      position: "left"
      size: 250
      html: '<div data-action="moveCell" data-args="left-sidebar,content"></div>'

  overlays:
    titleBar:
      breakpoints: "mobile"
      position: "top-center"
      width: "100%"
      height: 44
      html: '<div data-action="copyHTML" data-args="title"></div>'

    leftPanelButton:
      breakpoints: "mobile"
      position: "top-left"
      width: 80
      height: 60
      html: '<div class="toggle icon-angle-right" data-action="togglePanel" data-args="leftPanel"></div>'
