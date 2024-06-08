module Main (main) where

import Graphics.Gnuplot.Simple (Attribute (..), plotPath)
import Lib

main :: IO ()
main =
  let posInitial = 10 *^ kHat
      velInitial = 20 *^ cos (pi / 6) *^ iHat ^+^ 20 *^ sin (pi / 6) *^ kHat
      posFunc = projectilePos posInitial velInitial
      pairs = [(xComp r, zComp r) | t <- [0, 0.01 ..], let r = posFunc t]
      plotingPairs = takeWhile (\(_, z) -> z >= 0) pairs
   in plotPath
        [Title "Projectile Motion", XLabel "Horizontal Motion (m)", YLabel "Vertical Motion (m)", PNG "trajectory.png", Key Nothing]
        plotingPairs