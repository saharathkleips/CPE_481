10 PRINTCHR$(147)

15 PRINT"testing filters for all 3 voices..."

18 REM 16=low-pass, 64=high-pass, 32=band-pass
20 PRINT"(l)ow-pass,(h)igh-pass,or (b)and-pass?":PRINT:fl=32

30 GETa$:IFa$=""THEN30

40 IFa$="l"THEN70

50 IFa$="h"THEN80

60 IFa$="b"THEN80:GOTO30

70 fl=16:PRINT"low-pass selected...":GOTO100

80 fl=64:PRINT"high-pass selected...":GOTO100

90 PRINT"band-pass selected..."

100 POKE54296,15+fl

110 FORv=1TO3:PRINT:PRINT"voice";v:FORl=54272TO54295:POKEl,0:NEXT

120 ONvGOSUB170,180,190:POKEhf,15:POKElf,35:POKEhp,8:POKElp,0:POKEa,9:POKEs,128

130 POKEw,65:POKE54295,2^(v-1)+128:FORp=0TO1

140 FORf=0TO2047STEP9:GOSUB160:NEXT:FORf=2047TO0STEP-9:GOSUB160:NEXT:NEXT:NEXT

150 FORl=54272TO54296:POKEl,0:NEXT:GOTO200

160 PRINTf;"{left} {up}":POKE54294,f/8:POKE54293,fAND7:RETURN

170 w=54276:a=54277:s=54278:hf=54273:lf=54272:hp=54275:lp=54274:RETURN 

180 w=54283:a=54284:s=54285:hf=54280:lf=54279:hp=54282:lp=54281:RETURN 

190 w=54290:a=54291:s=54292:hf=54287:lf=54286:hp=54289:lp=54288:RETURN

200 PRINT:PRINT:PRINT"test again? (y/n)"

210 GETa$:IFa$=""THEN210

220 IFa$="y"THENRUN