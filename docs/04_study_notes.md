# Study Notes – Const, Routing & Animation

## Const Keyword in Flutter
- `const` = compile-time constant, wiederverwendetes Objekt → weniger Allocation.
- Klassen const-fähig machen: `const ClassName({super.key});`
- Nutzen: Klarheit + Performance.
- Nicht möglich, wenn Argumente zur Laufzeit berechnet werden.

**Merksatz:** „const = Versprechen: diese Widget-Konfiguration ändert sich nie.“

---

## Routing (MaterialApp.routes)
- Typ: `Map<String, WidgetBuilder>`
- Key = Routenname (String), Value = Builder-Funktion `(context) => Widget`.
- Navigation: `Navigator.pushNamed(context, '/login');`
- Gute Praxis: `static const route = '/welcome';` in jedem Screen → einheitliche, typosichere Routennamen.

---

## Animation Basics
- **Ticker**: liefert die Zeittakte (`with SingleTickerProviderStateMixin`).
- **AnimationController**: steuert Dauer + Fortschritt (`0.0 → 1.0`).
- `controller.forward()` startet, `controller.addListener(setState)` triggert Rebuilds.
- Wichtig: `dispose()` aufrufen, sonst Ticker-Leak.

---

## Mixins in Dart

### Erklärung
- **Mixins** sind ein Baukasten-Prinzip in Dart: Klassen können gezielt **Fähigkeiten** („kann etwas“) bekommen, ohne komplizierte Mehrfachvererbung.
- **Agnostisch:** Mixins sind **unabhängig von der Vererbungshierarchie**.
    - Sie können in beliebige Klassen „hineingemischt“ werden, egal ob die Klasse von `Object`, `Animal` oder etwas ganz anderem erbt.
    - Damit sind Mixins wiederverwendbare **Module**, die unabhängig von der Hauptstruktur des Programms funktionieren.
- **Syntax:**
  ```dart
  class MyClass with Mixin1, Mixin2 {}

---



