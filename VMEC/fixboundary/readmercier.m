% left = mercier( 1:47, :);  
% right = mercier( 48:94, :);     
% ans3 = [left, right];
rho=all(:,1);
for i=2:4
iota(:,i-1)=-all(:,(i-1)*8+3);
shear(:,i-1)=all(:,(i-1)*8+4);
well(:,i-1)=all(:,(i-1)*8+6);
dmercier(:,i-1)=all(:,(i-1)*8+8);
end
plot(rho,dmercier, 'linewidth',2)
legend('standard','halfvertical','fullhelical','Location','Best');
xlabel('Normalized Flux', 'FontName', 'Times New Roman', 'FontSize', 14);
ylabel('Dmercier', 'FontName', 'Times New Roman', 'FontSize', 20);
grid on;
ylim([25 35]);