function s = erf_1d_fit2data(m, xps)
% function s = erf_1d_fit2data(m, xps)

% convert to readable parameters
s0        = m(1);
d_iso     = m(2);
d_delta   = m(3);

a = 3*xps.b.*d_iso.*xps.b_delta.*d_delta;

s = s0.*exp(-xps.b.*d_iso).*exp(a/3).*...
    sqrt(pi)/2.*real(gammainc(a,1/2)./sqrt(a));

indx = a == 0;
s(indx) = exp(-xps.b(indx).*d_iso);
s(xps.b == 0) = 1;