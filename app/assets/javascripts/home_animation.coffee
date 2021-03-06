$(document).ready ->

  # Variables
  $document = $(@)
  $logo = $("#logo")
  $ruby = $("#ruby")
  $airplan = $("#airplan")
  $cloud1 = $("#cloud1")
  $cloud3 = $("#cloud3")
  $info = $("#info")
  $registration = $("#registration")
  $mountain = $("#mountain")
  $tube = $("#tub-repeat")
  $dwarf = $("#dwarf")
  $inkWave = $("#ink-wave")

  _animationPlayed = false

  # Easeing Function
  _easing = 'cubic-bezier(0.64, -0.22, 0.45, 1.72)'

  # Animate Helper
  animate = (object, options, time, easing) ->
    easing ||= _easing
    return (next)->
      object.transition(options, time, easing, next)

  queueAnimate = (animations) ->
    return ->
      $document.queue(animations)

  spriteAnimate = (object, columnWidth, columns, fps) -> # Sprite Animate using background-position
    fps ||= 30
    frameTime = 1000 / fps
    return (next) ->
      object.animate({
        'background-position-x': columnWidth * columns + 'px'
      }, {
        duration: frameTime * columns
        complete: next
        step: (p, fx) ->
          fx.now = Math.floor(p / columnWidth) * columnWidth # Force override to make sprite animate
      })

  parallelAnimation = (animations, delay, next) ->
    delay ||= 200
    # TODO: Should using "Promise" to catch animation finished time to prevent delay cannot control
    animations.push(next) if next and typeof next is "function"
    for animation, index in animations
      setTimeout(animation, index * delay)

  # Build animation queue
  Pace.on 'done', ->
    return if _animationPlayed # Only play animation 1 times
    # console.log($document.width());
    if $document.width() > 992
      animation_queue = [
        (next) -> $airplan.show(next),
        animate($logo, {x: '-50%', y: '-50%', opacity: 1}, 1000),
        animate($ruby, {scale: 1}, 1000),
        animate($cloud1, {scale: 1}, 1000),
        animate($cloud3, {scale: 1}, 1000),
        animate($info, {y: '0%', opacity: 1}, 1000),
        animate($registration, {y: '0%', opacity: 1}, 1000),
        animate($mountain, {y: '0%'}, 1000, 'cubic-bezier(1, 0, 0, 1)'),
        animate($tube, {y: '0%'}, 1500, 'cubic-bezier(1, 0, 0, 1)'),
        queueAnimate([
          animate($dwarf, {scale: 1, delay: 1500}, 1000),
          (next)-> parallelAnimation([
            spriteAnimate($dwarf, 100, 27, 24),
            animate($inkWave, {scale: 500, opacity: 0}, 1000, 'cubic-bezier(1, 0, 0, 1)'),
          ], 500, next)
          -> $inkWave.hide().dequeue() # Remove inkwave prevent mouse event
        ])
      ]
    else
      animation_queue = [
        (next) -> $airplan.show(next),
        animate($logo, {x: '-50%', y: '-50%', opacity: 1}, 1000),
        animate($ruby, {scale: 1}, 1000),
        animate($info, {y: '0%', opacity: 1}, 1000),
        animate($registration, {y: '0%', opacity: 1}, 1000),
        animate($mountain, {y: '0%'}, 1000, 'cubic-bezier(1, 0, 0, 1)'),
        animate($tube, {y: '0%'}, 1500, 'cubic-bezier(1, 0, 0, 1)'),
      ]
    # console.log(animation_queue);
    parallelAnimation(animation_queue)
    _animationPlayed = true
    if window.location.hash != '' && $(window.location.hash).length > 0
      $('.more-btn[href=' + window.location.hash + ']').trigger 'click'
