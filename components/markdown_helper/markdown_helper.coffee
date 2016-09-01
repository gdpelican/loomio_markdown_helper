angular.module('loomioApp').directive 'markdownHelper', ->
  scope: {comment: '='}
  restrict: 'E'
  replace: true
  templateUrl: 'generated/components/markdown_helper/markdown_helper.html'
  controller: ($scope, $timeout) ->
    wrap = (symbol) ->
      ->
        body   = $scope.comment.body
        start  = $scope.textarea.selectionStart or body.length
        finish = $scope.textarea.selectionEnd or body.length
        $scope.comment.body = [
                                body.substring(0, start),
                                symbol,
                                body.substring(start, finish),
                                symbol,
                                body.substring(finish, body.length)
                              ].join('')
        $timeout ->
          if start == finish then position = start + symbol.length else position = finish + (symbol.length*2)
          $scope.textarea.selectionStart = $scope.textarea.selectionEnd = position
          $scope.textarea.focus()

    $scope.bold = wrap('**')
    $scope.italic = wrap('_')

    return

  link: (scope, elem, attr) ->
    scope.textarea = $(elem).parent().siblings('textarea')[0]
