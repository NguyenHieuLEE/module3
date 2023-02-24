use furama;
-- 2
SELECT *FROM nhan_vien
WHERE SUBSTRING_INDEX(Nho_ten, ' ', -1) REGEXP '^[HTK]' AND CHAR_LENGTH(Nho_ten) <= 15;
-- 3
select *,year(curdate())-year(kngay_sinh) as 'Tuổi' from khach_hang 
where ( 18<= year(curdate())-year(kngay_sinh) and  year(curdate())-year(kngay_sinh) <= 50) and (kdia_chi like '%Đà Nẵng%' or kdia_chi like '%Quảng Trị%');
-- 4
select k.ma_khach_hang,k.kho_ten,count(h.ma_khach_hang) as 'số lần đặt' 
from hop_dong as h
left join khach_hang as k on k.ma_khach_hang=h.ma_khach_hang
left join loai_khach as l on l.ma_loai_khach = k.ma_loai_khach
where l.ten_loai_khach='Diamond'
group by k.ma_khach_hang,k.kho_ten
order by count(h.ma_khach_hang) asc;
-- 5
select kh.ma_khach_hang , kh.kho_ten , lk.ten_loai_khach ,
ifnull(ct.ma_hop_dong , 'Chưa có hợp đồng')  as 'Mã Hợp Đồng' ,
ifnull(dv.ten_dich_vu , 'chưa có dịch vụ') as 'Tên Dịch Vụ',
ifnull(ct.ngay_lam_hop_dong, 'chưa có ') as "ngày làm hợp đồng",
ifnull(ct.ngay_ket_thuc,'chưa có ') as "ngày kết thúc",
sum(ifnull(dv.chi_phi_thue ,0) + ifnull(ctc.so_luong,0)*ifnull(dvdk.gia,0))  as 'Tổng Tiền' 
from khach_hang kh
join loai_khach as lk on lk.ma_loai_khach = kh.ma_loai_khach
left join hop_dong ct on ct.ma_khach_hang = kh.ma_khach_hang
left join dich_vu as dv on ct.ma_dich_vu = dv.ma_dich_vu
left join hop_dong_chi_tiet as ctc on  ct.ma_hop_dong = ctc.ma_hop_dong
left join dich_vu_di_kem as dvdk on  ctc.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by ct.ma_hop_dong , kh.ma_khach_hang
order by ma_khach_hang asc ;
-- 6
-- ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu 
select dv.ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu
from dich_vu dv 
join loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
where dv.ma_dich_vu not in
(select hd.ma_dich_vu
from dich_vu dv
join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu
where 
ngay_lam_hop_dong between '2021-01-01' and '2021-03-31');
-- 7 ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu 
select ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu 
from dich_vu dv
join loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
where dv.ma_dich_vu in
(select hd.ma_dich_vu
from dich_vu dv
join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu
where 
ngay_lam_hop_dong between '2020-01-01' and '2020-12-31');
-- 8 
-- c1
select distinct (kho_ten) 
from khach_hang kh;
-- c2
select Kho_ten from khach_hang
group by kho_ten;
-- c3
select kho_ten from khach_hang
union select kho_ten from khach_hang;
-- 9
select month(ngay_lam_hop_dong) as thang, count(ma_khach_hang) as 'so khach dat phong' from hop_dong hd 
where ngay_lam_hop_dong between '2021-01-01' and '2021-12-31'
group by thang
order by thang asc;
-- 10 ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem 
select hd.ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ifnull(sum(hdct.so_luong),) as 'so luong' from hop_dong as hd
left join hop_dong_chi_tiet hdct on hd.ma_hop_dong=hdct.ma_hop_dong
group by hd.ma_hop_dong;
-- 11
select dvdk.ma_dich_vu_di_kem , dvdk.ten_dich_vu_di_kem from dich_vu_di_kem dvdk
inner join hop_dong_chi_tiet as hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
inner join hop_dong as hd on hd.ma_hop_dong = hdct.ma_hop_dong
inner join khach_hang as kh on kh.ma_khach_hang = hd.ma_khach_hang
inner join loai_khach as lk on lk.ma_loai_khach = kh.ma_loai_khach
where (lk.ma_loai_khach = 1 and (kdia_chi like "%Quảng Ngãi%" or kdia_Chi like "%Vinh%"));
-- 12 Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
select hd.ma_hop_dong, nho_ten, kho_ten, kso_dien_thoai, ten_dich_vu, ifnull(sum(hdct.so_luong),0) as 'so luong', tien_dat_coc
from hop_dong hd 
left join nhan_vien nv on nv.ma_nhan_vien=hd.ma_nhan_vien
left join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
left join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
left join hop_dong_chi_tiet hdct on hd.ma_hop_dong=hdct.ma_hop_dong
where (ngay_lam_hop_dong between '2020-10-1' and '2020-12-31')and (ngay_lam_hop_dong not between '2021-01-01'
        and '2021-6-30')
group by hd.ma_hop_dong;
-- 13--
-- C1	
select  ma_dich_vu_di_kem ,ten_dich_vu_di_kem , count(hdct.ma_dich_vu_di_kem) as 'Số Lần Đặt' , sum(hdct.so_luong) as so_luong  from hop_dong_chi_tiet hdct
left join dich_vu_di_kem using (ma_dich_vu_di_kem)
group by ma_dich_vu_di_kem 
order by so_luong desc limit 1;
-- C2
select  ma_dich_vu_di_kem ,ten_dich_vu_di_kem , count(hdct.ma_dich_vu_di_kem) as 'Số Lần Đặt' , sum(hdct.so_luong) as so_luong  
from hop_dong_chi_tiet hdct
left join dich_vu_di_kem using (ma_dich_vu_di_kem)
group by ma_dich_vu_di_kem 
HAVING so_luong >= ALL (SELECT so_luong FROM hop_dong_chi_tiet GROUP BY hop_dong_chi_tiet.ma_hop_dong_chi_tiet);
-- 14 ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung 
select hd.ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, count(dvdk.ma_dich_vu_di_kem) as 'so lan su dung'
from hop_dong hd
join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
join loai_dich_vu ldv on ldv.ma_loai_dich_vu=dv.ma_loai_dich_vu
join hop_dong_chi_tiet hdct on hd.ma_hop_dong=hdct.ma_hop_dong
join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem=hdct.ma_dich_vu_di_kem
group by hd.ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem
HAVING count(dvdk.ma_dich_vu_di_kem) = 1;
-- 15

SELECT ma_nhan_vien, nho_ten, ten_trinh_do, ten_bo_phan, nso_dien_thoai, ndia_chi, count(hd.ma_nhan_vien) tong_so_hop_dong
FROM
    nhan_vien
    JOIN trinh_do USING (ma_trinh_do)
    JOIN bo_phan USING (ma_bo_phan)
    JOIN hop_dong hd USING (ma_nhan_vien)
where
    year(ngay_lam_hop_dong) BETWEEN 2020 and 2021
group by
    hd.ma_nhan_vien
having
    tong_so_hop_dong <= 3;	
-- 16
delete from nhan_vien nv
where not exists(
select * from hop_dong hd 
where 
hd.ma_nhan_vien=nv.ma_nhan_vien
 and YEAR(ngay_lam_hop_dong) BETWEEN 2019 and 2021
 );
 select * from nhan_vien;
-- 17
update khach_hang kh_a
set
ma_loai_khach = 1 
where
kh_a.ma_khach_hang in  (select * from (select kh.ma_khach_hang from khach_hang kh
left join loai_khach lk using(ma_loai_khach)
where lk.ten_loai_khach = 'Platinium') as a);
-- 18
set foreign_key_checks = 0;
delete kh , hd from khach_hang kh join hop_dong as hd using(ma_khach_hang)
where kh.ma_khach_hang in (select * from (select ma_khach_hang from hop_dong join khach_hang using (ma_khach_hang) where year(ngay_lam_hop_dong) < 2021) as abc );
set foreign_key_checks = 1;

select ma_khach_hang ,kho_ten from khach_hang;
select *  from hop_dong;
-- 19
update dich_vu_di_kem 
set 
gia = gia*2
where(
ma_dich_vu_di_kem in (select * from (  select ma_dich_vu_di_kem from hop_dong_chi_tiet
group by ma_dich_vu_di_kem
having sum(so_luong) > 10) as a )
);
select * from dich_vu_di_kem;
-- 20
select nv.ma_nhan_vien as id , nv.nho_ten, nv.nemail, nv.nso_dien_thoai, nv.nngay_sinh, nv.ndia_chi from nhan_vien nv
union
select kh.ma_khach_hang , kh.kho_ten , kh.kemail , kh.kso_dien_thoai , kh.kngay_sinh , kh.kdia_chi from khach_hang kh;
-- 21 
create view nhan_vien_view as
select  ma_nhan_vien, nho_ten, ndia_chi, nso_dien_thoai
from nhan_vien 
join hop_dong using (ma_nhan_vien)
where ndia_chi like '%Đà Nẵng%' and year(ngay_lam_hop_dong)='2021';
select * from nhan_vien_view;
-- 22
update nhan_vien_view set ndia_chi = 'Liên Chiểu';




