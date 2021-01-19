<TeXmacs|1.99.13>

<style|<tuple|generic|spanish>>

<\body>
  <doc-data|<doc-title|Sintaxis y Semántica de los lenguajes<new-line>Trabajo
  práctico N<degreesign> 2<new-line>BNF Lenguaje
  Mini>|<doc-author|<author-data|<author-name|Grupo 01>|<\author-affiliation>
    UTN FRBA
  </author-affiliation>>>>

  <center|Este documento pretende documentar las gramáticas sintácticas y
  léxicas del lenguaje mini, del trabajo práctico N<degreesign> 2, en el
  contexto de grado de la carrera ingeniería en sistemas información, de la
  materia Sintaxis y Semántica de los Lenguages>

  \;

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Convenciones
    y notaciones adoptadas> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>BNF
    Sintáctica> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>BNF
    Léxica> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Observaciones>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5<space|2spc>Bibliografía
    empleada> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>
  </table-of-contents>

  <new-page>

  <section|Convenciones y notaciones adoptadas>

  Las convenciones y notaciones adoptadas en el presente documento adopta la
  forma estandarizada de la BNF del lenguaje C, descriptas en el pdf
  05-SintaxisBNF. Las mismas son:

  <\itemize>
    <item>No terminales

    <\itemize>
      <item>Van en cursiva
    </itemize>
  </itemize>

  <\itemize>
    <item>Terminales

    <\itemize>
      <item>Van en negrita
    </itemize>
  </itemize>

  <\itemize>
    <item>El metasímbolo de producción es :

    <item>Para indicar opciones de producción

    <\itemize>
      <item>Una por renglón
    </itemize>
  </itemize>

  <\itemize>
    <item>Para indicar varias opciones por renglón

    <\itemize>
      <item>Se precede el uso del metasímbolo <em|one of>
    </itemize>
  </itemize>

  <\itemize>
    <item>Para indicar que un término es opcional

    <\itemize>
      <item>Subíndice <em|opt>
    </itemize>

    <item>En la gramática sintáctica, el axioma es el no terminal de más
    abajo
  </itemize>

  <section|BNF Sintáctica>

  <em|expresion-primaria>:

  \ \ \ \ \ \ \ \ <em|constante-entera>

  \ \ \ \ \ \ \ \ <em|identificador>

  \ \ \ \ \ \ \ \ <strong|(> <em|expresion-aditiva> <strong|)>

  \ \ \ \ \ \ \ \ <strong|\U> <em|expresion-aditiva>

  \;

  <em|expresion-multiplicativa>:

  \ \ \ \ \ \ \ \ <em|expresion-primaria>

  \ \ \ \ \ \ \ \ <em|expresion-multiplicativa> <strong|*>
  <em|expresion-primaria>

  \ \ \ \ \ \ \ \ <em|expresion-multiplicativa> <strong|/>
  <em|expresion-primaria>

  \;

  \;

  <em|expresion-aditiva>:

  \ \ \ \ \ \ \ \ <em|expresion-multiplicativa>

  \ \ \ \ \ \ \ \ <em|expresion-aditiva> <strong|+>
  <em|expresion-multiplicativa>

  \ \ \ \ \ \ \ \ <em|expresion-aditiva> <strong|->
  <em|expresion-multiplicativa>

  \;

  <em|lista-identificadores>:

  \ \ \ \ \ \ \ \ <em|identificador> <strong|,> <em|lista-identificadores>

  \ \ \ \ \ \ \ \ <em|identificador>

  \;

  <with|font-shape|italic|lista-expresiones>:

  <space|2em><with|font-shape|italic|expresion-aditiva>
  <with|font-series|bold|,> <with|font-shape|italic|lista-expresiones>

  <space|2em><with|font-shape|italic|expresion-aditiva>

  \;

  <em|sentencia>:

  \ \ \ \ \ \ \ \ <em|identificador> <em|asignacion> <em|expresion-aditiva>
  <strong|;>

  \ \ \ \ \ \ \ \ <strong|declarar> <em|identificador> <strong|;>

  \ \ \ \ \ \ \ \ <strong|leer> <strong|(> <em|lista-identificadores>
  <strong|)> <strong|;>

  \ \ \ \ \ \ \ \ <strong|escribir> <strong|(> <em|lista-expresiones>
  <strong|)> <name|<strong|;>>

  \;

  <em|lista-sentencias>:

  \ \ \ \ \ \ \ \ <em|sentencia> <em|lista-sentencias>

  \ \ \ \ \ \ \ \ <em|sentencia>

  \;

  <em|programa-mini>:

  \ \ \ \ \ \ \ \ <strong|programa> <em|lista-sentencias<math|<rsub|opt>>>
  <strong|fin-prog>

  <section|BNF Léxica>

  <em|token>:

  \ \ \ \ \ \ \ \ <em|identificador>

  \ \ \ \ \ \ \ \ <em|palabra-reservada>

  \ \ \ \ \ \ \ \ <em|constante-entera>

  <\em>
    \ \ \ \ \ \ <space|1em>operador

    \ \ \ \ \ \ <space|1em>caracter-puntuacion

    <space|3em>asignacion
  </em>

  \;

  <em|identificador>:

  \ \ \ \ \ \ \ \ <em|letra> <em|resto-identificador><math|<rsub|opt>>

  \;

  <em|resto-identificador>:

  \ \ \ \ \ \ \ \ <em|letra resto-identificador><math|<rsub|opt>>

  \ \ \ \ \ \ \ \ <em|digito-decimal resto-identificador><math|<rsub|opt>>

  \;

  <with|font-shape|italic|asginacion>:

  <space|2em><with|font-shape|italic|\<less\>\U>

  \;

  <em|palabra-reservada>: <em|one of>

  \ \ \ \ \ \ \ \ <strong|leer<space|1em>declarar<space|1em>escribir<space|1em>programa<space|1em>fin-prog>

  \;

  <em|constante-entera>:

  \ \ \ \ \ \ \ \ <em|digito-decimal constante-entera><math|<rsub|opt>>

  \;

  <em|operador>: <em|one of>

  \ \ \ \ \ \ \ \ <strong|+<space|1em>-<space|1em>*<space|1em>/>

  \;

  <em|caracter-puntuacion>: <em|one of>

  \ \ \ \ \ \ \ \ <strong|(<space|1em>)<space|1em>,<space|1em>;>

  \;

  <em|digito-decimal>: <em|one of>

  \ \ \ \ \ \ \ \ <strong|0<space|1em>1<space|1em>2<space|1em>3<space|1em>4<space|1em>5<space|1em>6<space|1em>7<space|1em>8<space|1em>9>

  \;

  <em|letra>: <em|one of>

  <\strong>
    \ \ \ \ \ \ \ \ a \ \ \ b \ \ \ \ c \ \ \ d
    \ \ \ e<space|1em>f<space|1em>g<space|1em>h<space|1em>i
    \ \ \ \ \ j<space|1em> \ k<space|1em> l<space|1em> m

    \ \ \ \ \ \ \ \ n \ \ \ o \ \ \ \ p \ \ q<space|1em>
    r<space|1em>s<space|1em>t \ \ \ u<space|1em>v<space|1em> w<space|1em>
    x<space|1em>y<space|1em> z

    \ \ \ \ \ \ \ \ A \ \ \ B \ \ \ C \ \ \ D<space|1em>E \ \ F<space|1em>G
    \ \ H<space|1em>I<space|1em> \ J<space|1em> \ K<space|1em>L<space|1em>M

    \ \ \ \ \ \ \ \ N<space|1em>O \ \ \ P \ \ \ Q \ \ R \ \ S<space|1em>T
    \ \ U<space|1em>V<space|1em>W<space|1em> X<space|1em>Y<space|1em>Z
  </strong>

  <section|Observaciones>

  Los comentarios, que son la sucesión de símbolos formados principalmente
  por el doble numeral (##) como prefijo, seguidos de la sucesión de símbolos
  propiamente dichas, son ignorados por el analizador léxico, no dando lugar
  a ser conocida por el analizador sintáctico. En otras palabras, el scanner
  no tendrá en ningún momento un \Ptoken comentario\Q como resultado, ni
  tampoco el parser tendrá como entrada un \Ptoken comentario\Q.

  En conclusión, un comentario no es un elemento léxico, ni tampoco
  sintáctico.

  <section|Bibliografía empleada>

  Zúñiga, Eduardo. (2020). <em|Sintaxis y BNF>. Recuperado de
  <slink|https://tinyurl.com/5-SintaxisYBnf>

  Zúñiga, Eduardo. (2020). <em|Proceso de Compilación>. Recuperado de
  <slink|https://tinyurl.com/13-ProcesoDeCompilacion>

  Zúñiga, Eduardo. (2020). <em|Análisis>. Recuperado de
  <slink|https://tinyurl.com/14-analisis>

  ISO/IEC9899:2017, Programming languages \U C. Recuperado de
  <slink|https://tinyurl.com/c17ballot>
</body>

<\initial>
  <\collection>
    <associate|font|Open>
    <associate|font-base-size|11>
    <associate|font-family|rm>
    <associate|math-font|math-stix>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|2>>
    <associate|auto-2|<tuple|2|2>>
    <associate|auto-3|<tuple|3|3>>
    <associate|auto-4|<tuple|4|5>>
    <associate|auto-5|<tuple|5|5>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Convenciones
      y notaciones adoptadas> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>BNF
      Sintáctica> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>BNF
      Léxica> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Observaciones>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Bibliografía
      empleada> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>