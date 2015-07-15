
#
# Slide 16 (spheres: partial)
#

library(rgl)

imagedir <- '../charts'
lod_file1 <- 'lod-sphere1.png'
lod_file2 <- 'lod-sphere2.png'

open3d()
spheres3d(x=1,y=1,z=1,radius=1,color='lightcyan',smoot=F)
axes3d()

# Pause the script, and rotate the sphere and axes into a desired view, then:
rgl.snapshot(lod_file1)


open3d()
shade3d( translate3d( icosahedron3d(col="magenta"), 1, 1, 1) )
axes3d()

# Pause the script, and rotate the sphere and axes into a desired view, then:
rgl.snapshot(lod_file2)
