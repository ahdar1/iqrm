* Encoding: UTF-8.
* Encoding: .
DATA LIST FREE/Z Effect se t p LLCI ULCI.
BEGIN DATA.
     1.0000     -.1024      .0485    -2.1101      .0356     -.1978     -.0069 
     1.1331     -.0915      .0465    -1.9669      .0500     -.1831      .0000 
     1.3158     -.0767      .0439    -1.7459      .0817     -.1630      .0097 
     1.6316     -.0509      .0396    -1.2848      .1997     -.1289      .0270 
     1.9474     -.0252      .0359     -.7030      .4825     -.0957      .0453 
     2.2632      .0005      .0327      .0160      .9873     -.0638      .0648 
     2.5789      .0262      .0304      .8637      .3884     -.0335      .0860 
     2.8947      .0520      .0291     1.7848      .0752     -.0053      .1093 
     2.9571      .0571      .0290     1.9669      .0500      .0000      .1141 
     3.2105      .0777      .0290     2.6768      .0078      .0206      .1348 
     3.5263      .1034      .0301     3.4337      .0007      .0442      .1627 
     3.8421      .1292      .0323     4.0008      .0001      .0657      .1927 
     4.1579      .1549      .0353     4.3857      .0000      .0854      .2243 
     4.4737      .1806      .0390     4.6289      .0000      .1039      .2574 
     4.7895      .2063      .0432     4.7744      .0000      .1213      .2913 
     5.1053      .2321      .0478     4.8566      .0000      .1381      .3261 
     5.4211      .2578      .0526     4.8991      .0000      .1543      .3613 
     5.7368      .2835      .0577     4.9170      .0000      .1701      .3969 
     6.0526      .3092      .0629     4.9200      .0000      .1856      .4329 
     6.3684      .3350      .0682     4.9139      .0000      .2009      .4691 
     6.6842      .3607      .0736     4.9025      .0000      .2160      .5054 
     7.0000      .3864      .0791     4.8881      .0000      .2309      .5419
END DATA.


GGRAPH
/GRAPHDATASET NAME="simpleeffect_Z" VARIABLES=Z Effect LLCI ULCI
/GRAPHSPEC SOURCE=INLINE.
BEGIN GPL
SOURCE: s = userSource(id("simpleeffect_Z")) 
DATA: Z=col(source(s), name("Z")) 
DATA: Effect=col(source(s), name("Effect")) 
DATA: LLCI=col(source(s), name("LLCI")) 
DATA: ULCI=col(source(s), name("ULCI")) 
GUIDE: axis(dim(2), label("Conditional Effect")) 
GUIDE: axis(dim(1), label("Attractiveness"))
GUIDE: form.line(position(1.1331,*), shape(shape.dash))
GUIDE: form.line(position(2.9571,*), shape(shape.dash))
GUIDE: text.title(label("Conditional Effects of Authenticity "))
GUIDE: text.subtitle(label("At Different Values of Attractiveness"))
GUIDE: text.footnote(label("Note: The dash line intersects x-axis at the J-N point, region above the point is significant"))
ELEMENT: point(position(Z*Effect))
ELEMENT: line(position(Z*Effect),shape("Point estimate"))
ELEMENT: point(position(Z*LLCI))
ELEMENT: line(position(Z*LLCI),shape("95% Lower limit"))
ELEMENT: point(position(Z*ULCI))
ELEMENT: line(position(Z*ULCI),shape("95% Upper limit"))
END GPL.


