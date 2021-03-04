function[xm,fv]=PSO(fitness, N, c1, c2, w, M, D)
%%%%%%%������ʼ������%%%%%%%
% c1 ѧϰ����1
% c2 ѧϰ����2
% w ����Ȩ��
% M ����������
% D �����ռ�ά��
% N ��ʼ��Ⱥ�������Ŀ
%%%%%%%��ʼ����Ⱥ���壨�޶�λ�ú��ٶȷ�Χ��%%%%%%%
format long;
for i = 1: N
	for j = 1: D
		x(i,j) = randn;	% �����ʼ��λ��
		v(i,j) = randn; % �����ʼ���ٶ�
	end
end
%%%%%%%�ȼ���������ӵ���Ӧ�ȣ�����ʼ��Pi��Pg%%%%%%%
for i = 1: N
	p(i) = fitness(x(i,:));
	y(i,:) = x(i,:);
end
pg = x(N,:); % pgΪȫ������
for i = 1:(N-1)
	if fitness(x(i,:)) < fitness(pg)
		pg = x(i,:);
	end
end
%%%%%%%������ѭ�������չ�ʽ���ε�����֪�����㾫��Ҫ��%%%%%%%
for t = 1:M
	for i = 1:N % �����ٶȺ�λ��
		v(i,:) = w * v(i,:) + c1 * rand * (y(i,:)-x(i,:)) + c2 * rand * (pg - x(i,:));
		x(i,:) = x(i,:) + v(i,:);
		if fitness(x(i,:)) < p(i)
			p(i) = fitness(x(i,:));
			y(i,:) = x(i,:);
		end
		if p(i) < fitness(pg)
			pg = y(i,:);
		end
	end
	Pbest(t) = fitness(pg);
end
%%%%%%%������������%%%%%%%
disp('***********************')
disp('Ŀ�꺯��ȡ��Сֵʱ�Ա�����')
xm = pg'
disp('Ŀ�꺯����СֵΪ��')
fv = fitness(pg)
disp('***********************')