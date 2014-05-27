@dashboard.directive 'editor', ->
  restrict: 'E'
  replace: true
  template: """
    <section class="editor">
      <form>
        <input type="text" ng-model="editor.title" />
        <textarea ng-model="editor.content"></textarea>
      </form>
    </section>
  """
  link: (scope, element, attrs) ->
