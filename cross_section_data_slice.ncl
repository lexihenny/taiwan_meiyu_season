; load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
; load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
; load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

begin

;this script was used to make cross-sections based on the endpoints.  

diri="/thorncroftlab_rit/ahenny/rain/DISSERTATION_SCRIPTS_RESULTS/"
;fili="moisture_flux9_taiwan_era5.nc"
;fili="era_5_MY1composite_q_levels6_taiwan.nc"
fili="era_5_taiwan_xc_vars.nc"
fi=addfile(diri+fili,"r")
;print(fi)


;u=fi->moisture_flux_x(:,:,::-1,:)
;printVarSummary (u)
;u=fi->u(:,:,::-1,:)
;u=fi->v(:,:,::-1,:)
;u=fi->t_june_2012(:,:,::-1,:)
level=fi->level
time=fi->time
latitude=fi->latitude
longitude=fi->longitude
;mx=fi->mflux_x(:,:,::-1,:)
;my=fi->mflux_y(:,:,::-1,:)
u=fi->u(:,:,::-1,:)
v=fi->v(:,:,::-1,:)
q=fi->q(:,:,::-1,:)




lons_left=(/115.0, 115.25, 115.5, 115.75, 116.0, 116.25, 116.5, 116.75, 117.0, 117.25, 117.5, 117.75/)
lons_right=(/120.0, 120.25, 120.5, 120.75, 121.0, 121.25, 121.5, 121.75, 122.0, 122.25, 122.5, 122.75/)
lats_left=(/24.30512901345454, 24.744203555454696, 24.635763452495127, 25.06224146570295, 24.941386686250723, 25.33000563390825, 25.213897563989942, 25.35916434210053, 25.544626534456967, 25.744554173594018, 26.199009679530207, 27.065763149199114/)
lats_right=(/14.944870986545459, 15.005796444545302, 15.114236547504873, 15.18775853429705, 15.308613313749277, 15.41999436609175, 15.536102436010058, 15.64083565789947, 15.705373465543033, 15.755445826405984, 15.800990320469795, 15.684236850800886/)


num_index=10
leftlat  =  lats_left(num_index)
rightlat =  lats_right(num_index)

leftlon  =  lons_left(num_index)
rightlon =  lons_right(num_index)

npts     =   100                    ; number of points in resulting transect

dist     = gc_latlon(leftlat,leftlon,rightlat,rightlon,npts,2)
;printVarSummary(dist)
lats=dist@gclat
lons=dist@gclon
;lats=floattoint(lats)
print(lats)
print(lons)
;print (dist@gclat+"  "+dist@gclon )  ; print the lats/lons
points   = ispan(0,npts-1,1)*1.0 

trans   = linint2_points(u&longitude,u&latitude,u,False,dist@gclon,dist@gclat,2)
copy_VarAtts(u,trans)          ; copy attributes

trans1   = linint2_points(v&longitude,v&latitude,v,False,dist@gclon,dist@gclat,2)
copy_VarAtts(v,trans1)          ; copy attributes

trans2   = linint2_points(q&longitude,q&latitude,q,False,dist@gclon,dist@gclat,2)
copy_VarAtts(q,trans2)          ; copy attributes

;printVarSummary(trans->gclon)
trans!0="time"
trans&time=time
trans!1      = "level"           ; create named dimension and assign
trans&level    = u&level           ; coordinate variable for 0th dimension only
new_dimension=ispan(0,99,1)
trans!2="transect"
trans&transect=new_dimension

trans1!0="time"
trans1&time=time
trans1!1      = "level"           ; create named dimension and assign
trans1&level    = v&level           ; coordinate variable for 0th dimension only
new_dimension=ispan(0,99,1)
trans1!2="transect"
trans1&transect=new_dimension

trans2!0="time"
trans2&time=time
trans2!1      = "level"           ; create named dimension and assign
trans2&level    = q&level           ; coordinate variable for 0th dimension only
new_dimension=ispan(0,99,1)
trans2!2="transect"
trans2&transect=new_dimension

printVarSummary(trans)
;printVarSummary(trans->time)

setfileoption("nc","Format","NetCDF4")
;setfileoption("nc","LargeFile")
;f=addfile(diri+"taiwan_mflux_cross_section_"+tostring(num_index)+".nc","c")
;---Open a new NetCDF file to write to
fout_name = diri+"taiwan_mflux_cross_section_uvq_"+tostring(num_index)+".nc"
system("rm -f " + fout_name)
fout = addfile(fout_name,"c")

lats_new=lats
lons_new=lons
lats_new!0="lats"
lons_new!0="lons"
lats_new&lats=lats
lons_new&lons=lons

fout->trans_u=trans
fout->trans_v=trans1
fout->trans_q=trans2
fout->lats=lats
fout->lons=lons


end