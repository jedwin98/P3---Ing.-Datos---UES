insert into DimTiempo
select date_key, full_date, day_of_week, day_num_in_month, day_num_overall, day_name, day_abbrev, weekday_flag, 
week_num_in_year, week_num_overall, week_begin_date, week_begin_date_key, [month], month_num_overall, month_name, 
month_abbrev, [quarter], [year], yearmo, fiscal_month, fiscal_quarter, fiscal_year, last_day_in_month_flag, 
same_day_year_ago_date from Date_Dimension
