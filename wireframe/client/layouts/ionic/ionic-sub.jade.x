# when we want to remove ionic

template(name='ionBody')
  h3 ionBody

  .ionic-body(class=platformClasses)
    {{> UI.contentBlock}}


template(name='ionNavBar')
  h3 ionNavBar
  {{> UI.contentBlock}}

template(name='ionNavView')
  h3 ionNavBar
  {{> UI.contentBlock}}

template(name='ionContent')
  {{> UI.contentBlock}}