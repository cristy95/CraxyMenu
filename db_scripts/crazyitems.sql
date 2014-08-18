
create table crazyitems(
	item_id int,
	name text,
	item_size text,
	price float
);

--controller
create or replace
	function setcrazyitems(p_item_id int, p_name text, p_item_size text, p_price float)
returns text as
$$
declare
	v_item_id int;
begin
	select into v_item_id item_id from crazyitems
		where item_id = p_item_id;
	if v_item_id isnull then
		insert into crazyitems(item_id, name, item_size, price) values (p_item_id, p_name, p_item_size, p_price);
	else
		update crazyitems 
			set name = p_name, item_size = p_item_size, price = p_price 
			where item_id = p_item_id;
	end if;
	return 'DONE';
end;
$$
language 'plpgsql';

--view
create or replace
	function getlist(out int, out text, out text, out float)
returns setof record as
$$
	select * from crazyitems;
$$
language 'sql';
