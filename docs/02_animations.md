# Animationen (Experimente)

## Was wurde ausprobiert?
- `AnimationController` und `upperBound = 80.0`
- Logo-Größe animiert
- Text-Widget dynamisch mit `controller.value.toInt()`

## Learnings
- Ticker via `SingleTickerProviderStateMixin`
- Rebuilds sicher steuern (setState vs. Animated Widgets)

---

## Tween-Animation (ColorTween)

Neu hinzugekommen ist eine Tween-Animation für den Hintergrund:

```dart
late final Animation<Color?> _bg;

_bg = ColorTween(
  begin: Colors.blueGrey,
  end: Colors.white,
).animate(_controller);

