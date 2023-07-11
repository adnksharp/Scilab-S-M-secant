function F = g(x)
	F = (f(1) * x^3) + (f(2) * x^2) + (f(3) * x) + f(4);
endfunction

function DF = dg(x, x_1)
	F = g(x);
	F_1 = g(x_1);
	DF = (F_1 - F) / (x_1 - x);
endfunction

a = [ ], f = [ ];
tol = 0.0005 / 100;
c(1) = 0;
k = 0;
mprintf("\tMetodo Secante\n\n");
init = input("", "s");

x = strsubst(init, " ", "");
in_k = strstr(x, "x^3");
if in_k ~= "" then
	k = strsplit(x, "x^3");
	if size(k, "*") > 1 then
		if k(1) == "" || k(1) == "+" || k(1) == "-" then
			a(1) = "1";
		else
			a(1) = k(1);
		end
		x = k(2);
	end
else
	a(1) = "0";
end

in_k = strstr(x, "x^2");
if in_k ~= "" then
	k = strsplit(x, "x^2");
	if size(k, "*") > 1 then
		if k(1) == "" || k(1) == "+" || k(1) == "-" then
			a(2) = "1";
		else
			a(2) = k(1);
		end
		x = k(2);
	end
else
	a(2) = "0";
end

in_k = strstr(x, "x");
if in_k ~= "" then
	k = strsplit(x, "x");
	if size(k, "*") > 1 then
		if k(1) == "" || k(1) == "+" || k(1) == "-" then
			a(3) = "1";
		else
			a(3) = k(1);
		end
		x = k(2);
	end
else
	a(3) = "0";
end

if length(x) > 0 then
	a(4) = x;
else
	a(4) = "0";
end

for i = 1:4
	a(i) = strsubst(a(i), "(", "");
	a(i) = strsubst(a(i), ")", "");
	a(i) = strsubst(a(i), "%pi", "3.141592653589");
	a(i) = strsubst(a(i), "%e", "2.718281828459");
	k = strsplit(a(i), "/");
	if size(k, "*") > 1 then
		f(i) = strtod(k(1)) / strtod(k(2));
	else
		k = strsplit(a(i), "*");
		if size(k, "*") > 1 then
			f(i) = strtod(k(1)) * strtod(k(2));
		else
			f(i) = strtod(a(i));
		end
	end
end

mprintf("...\n\n");

F = g(c(1));
DF = dg(c(1), c(1) + 0.000005);
c(2) = c(1) - (F / DF);
k = 2;
while 1 then
	F = g(c(k));
	DF = dg(c(k), c(k - 1));
	k = k + 1;
	c(k) = c(k - 1) - (F / DF);
	if abs(c(k) - c(k - 1)) < tol then
		break;
	end
end

mprintf("f(x) = (%s)x^3 + (%s)x^2 + (%s)x + (%s)\n", string(f(1)), string(f(2)), string(f(3)), string(f(4)));
mprintf("x = %s\n", string(c(k)));
mprintf("iteraciones = %d\n", k);
