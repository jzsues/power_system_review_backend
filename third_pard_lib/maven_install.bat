@rem ***************************************************************************
@rem Copyright (C) 2013 ZVIDIA Co., Ltd.
@rem
@rem This program is free software; you can redistribute it and/or modify
@rem it under the terms of the GNU General Public License as published by
@rem the Free Software Foundation; either version 2 of the License, or
@rem (at your option) any later version.
@rem
@rem This program is distributed in the hope that it will be useful,
@rem but WITHOUT ANY WARRANTY; without even the implied warranty of
@rem MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
@rem GNU General Public License for more details.
@rem
@rem You should have received a copy of the GNU General Public License along
@rem with this program; if not, write to the Free Software Foundation, Inc.
@rem
@rem Contributors:
@rem     ZVIDIA Corporation - initial API and implementation
@rem ***************************************************************************
#*******************************************************************************
# Copyright (C) 2013 ZVIDIA Co., Ltd.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.
#
# Contributors:
#     ZVIDIA Corporation - initial API and implementation
#*******************************************************************************
mvn install:install-file -Dfile=javase-2.3-SNAPSHOT.jar -DgroupId=com.google.zxing -DartifactId=javase -Dversion=2.3-SNAPSHOT -Dpackaging=jar

mvn install:install-file -Dfile=core-2.3-SNAPSHOT.jar -DgroupId=com.google.zxing -DartifactId=core -Dversion=2.3-SNAPSHOT -Dpackaging=jar

mvn install:install-file -Dfile=common-0.0.1-SNAPSHOT.jar -DgroupId=com.zvidia -DartifactId=common -Dversion=0.0.1-SNAPSHOT -Dpackaging=jar