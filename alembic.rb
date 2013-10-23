require 'formula'

class Alembic < Formula
  homepage 'http://opensource.imageworks.com/?p=alembic'
  url 'http://alembic.googlecode.com/files/Alembic_1.1.5_2013041100.tgz'
  sha1 '539813017342d156ed5b0efafc983bda9b2cb001'
  version '1.1.5'

  depends_on 'cmake' => :build
  depends_on 'boost'
  depends_on 'hdf5'
  depends_on 'ilmbase'

  def patches
    #Reported upstream http://code.google.com/p/alembic/issues/detail?id=310
    DATA
  end

  def install
    cmake_args = std_cmake_args + %w{. -DUSE_PYILMBASE=OFF -DUSE_PRMAN=OFF -DUSE_ARNOLD=OFF -DUSE_MAYA=OFF -DUSE_PYALEMBIC=OFF}
    cmake_args << "-DCMAKE_CXX_FLAGS='-std=c++11'"
    system "cmake", *cmake_args
    system "make", "install"
    #move everything upwards
    lib.install_symlink Dir[prefix/"alembic-1.1.5/lib/static/*"]
    include.install_symlink Dir[prefix/"alembic-1.1.5/include/*"]
    bin.install_symlink Dir[prefix/"alembic-1.1.5/bin/*"]
  end
end
__END__
diff --git a/lib/AbcOpenGL/Scene.cpp b/lib/AbcOpenGL/Scene.cpp
index f404329..73e758e 100644
--- a/lib/AbcOpenGL/Scene.cpp
+++ b/lib/AbcOpenGL/Scene.cpp
@@ -45,8 +45,8 @@ void setMaterials( float o, bool negMatrix = false )
 {
     if ( negMatrix )
     {
-        GLfloat mat_front_diffuse[] = { 0.1 * o, 0.1 * o, 0.9 * o, o };
-        GLfloat mat_back_diffuse[] = { 0.9 * o, 0.1 * o, 0.9 * o, o };
+        GLfloat mat_front_diffuse[] = { 0.1f * o, 0.1f * o, 0.9f * o, o };
+        GLfloat mat_back_diffuse[] = { 0.9f * o, 0.1f * o, 0.9f * o, o };
 
         GLfloat mat_specular[] = { 1.0, 1.0, 1.0, 1.0 };
         GLfloat mat_shininess[] = { 100.0 };
