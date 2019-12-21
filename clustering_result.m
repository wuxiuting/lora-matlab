function [center_1,center_2,center_3,center_b] = clustering(center1,center2,center3,centerb)

scatter(center1(:,2),1025-center1(:,1),'y*');
hold on;
scatter(sum(center1(:,2))/length(center1),1025-sum(center1(:,1))/length(center1),'r+');
hold on;
scatter(center2(:,2),1025-center2(:,1),'c*');
hold on;
scatter(sum(center2(:,2))/length(center2),1025-sum(center2(:,1))/length(center2),'m+');
hold on;
scatter(center3(:,2),1025-center3(:,1),'g*');
hold on;
scatter(sum(center3(:,2))/length(center3),1025-sum(center3(:,1))/length(center3),'k+');
hold on;
scatter(centerb(:,2),1025-centerb(:,1),'b*');
hold on;
scatter(sum(centerb(:,2))/length(centerb),1025-sum(centerb(:,1))/length(centerb),'k+');
hold on;
axis([0 1025 0 1025]);
title('clustering results');
center_1 = [sum(center1(:,2))/length(center1),1025-sum(center1(:,1))/length(center1)]
center_2 = [sum(center2(:,2))/length(center2),1025-sum(center2(:,1))/length(center2)]
center_3 = [sum(center3(:,2))/length(center3),1025-sum(center3(:,1))/length(center3)]
center_b = [sum(centerb(:,2))/length(centerb),1025-sum(centerb(:,1))/length(centerb)]

return;

