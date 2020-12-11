no_kryt = 4;
no_samples = 50;
no_zestawow = 25;

% no_kryt = 3;
% rozklad = 'Normalny';
% m=1;
% a0 = [[0.5 0 0]; [0 0.6 1]];
% a1 = [[2,3,1];[1,3,1];[3,2,1]];
% a2 = [8,11,4;4,8,8;8,5,9;5,6,11;11,4,9];
% a3 = [17,12,18;8,18,15;17,15,10;12,11,14;14,16,12;10,19,11];

% rozklad = 'Eksponencjalny';
% m=2;
% a0 = [[1.5 0 0.1]; [0 0.6 0]];
% a1 = [3,5,2;2,5,2;5,3,2;5,2,3;0,3,5];
% a2 = [11,12,21;21,8,18;8,21,17;8,24,6];
% a3 = [14,32,27;31,27,18;22,20,25;25,29,22;18,34,20];

% rozklad = 'Jednostajny';
% m=2;
% a0 = [[0 0 0.1]; [0 0.2 0]; [0.9 0 0]];
% a1 = [2,2,1;1,2,1;2,2,1;2,1,2;0,2,2;2,1,2];
% a2 = [6,6,11;11,4,10;4,11,9;4,13,3];
% a3 = [6,14,12;14,12,8;10,9,11;11,13,10;8,15,9];


% rozklad = 'Normalny';
% m=1;
% a0 = [[0.5 0 0]; [0 0.6 1]];
% a1 = [[2,3,1];[1,3,1];[3,2,1]];
% a2 = [8,11,4;4,8,8;8,5,9;5,6,11;11,4,9];
% a3 = [17,12,18;8,18,15;17,15,10;12,11,14;14,16,12;10,19,11];

z0 = nadir(a2);
z1 = idealny(a2);
z2 = antyidealny(a1);

max_val = z0;
if (sum(z1) < sum(z2))
    min_val = z1;
else
    min_val = z2;
end

if (sum(min_val) > sum(max_val))
    tmp = max_val;
    max_val = min_val;
    min_val = tmp;
end

for zestaw_i = 1:no_zestawow
    filename =  rozklad + "_N"+ no_kryt+"_M"+m+"_k" + zestaw_i + ".xlsx";
    mu = 2 + 7*rand;
    sigma = 3* rand;
    x = generate_data_limited(rozklad,no_samples, no_kryt, containers.Map(["mu", "sigma"], [mu, sigma]), min_val, max_val);
    writematrix(x,filename,'Sheet',"data")
    writematrix(a0,filename,'Sheet',"A0")
    writematrix(a1,filename,'Sheet',"A1")
    writematrix(a2,filename,'Sheet',"A2")
    writematrix(a3,filename,'Sheet',"A3")

end
