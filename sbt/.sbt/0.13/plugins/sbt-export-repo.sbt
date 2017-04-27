// https://github.com/sbt/sbt-export-repo
addSbtPlugin("com.eed3si9n" % "sbt-export-repo" % "0.1.0")

// Here's a sample project for dumping play dependencies:
/*
name := """play-java"""

version := "1.0-SNAPSHOT"

scalaVersion := "2.12.2"

crossScalaVersions := Seq("2.12.2", "2.11.11")

lazy val root = (project in file(".")).enablePlugins(PlayJava)

libraryDependencies += ws
libraryDependencies += cache
libraryDependencies += evolutions
libraryDependencies += javaJpa
libraryDependencies += jdbc

// This subproject is used for exporting repo only
lazy val dist = (project in file("dist")).
  enablePlugins(ExportRepoPlugin).
  dependsOn(root). // add your subprojects to export
  settings(
  name := "dist",
  publish := (),
  publishLocal := ()
)
*/
// Then run `sbt "publishLocal dist/exportRepo"`