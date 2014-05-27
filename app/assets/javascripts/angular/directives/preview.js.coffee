@dashboard.directive 'preview', ->
  restrict: 'E'
  replace: true
  template: """
    <section class="preview">
      <div class="title">{{ editor.title }}</div>
      <div class="content" ng-bind-html="previewContent"></div>
    </section>
  """
  link: (scope, element, attrs) ->
    scope.$watch 'editor.content', (content) ->
      scope.previewContent = marked(content)
