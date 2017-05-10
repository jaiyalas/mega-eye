{-# LANGUAGE TypeFamilies #-}

module Lib

import SFML.Graphics as SF
import Spine.C as SpineC


-- SF.RenderTarget
-- SF.RenderStates

data SkeletonDrawableData =
    { skeleton :: SpineC.Skeleton
    , state :: SpineC.AnimationState
    , timeScale :: Float
    , vertexArray :: SF.VertexArray
	, ownsAnimationStateData :: Boolean
	, worldVertices :: Float
    } deriving (Show, Eq)
--
newSkeletonDrawableData :: MonadIO m => SpineC.SkeletonData -> SpineC.AnimationStateData -> m a
newSkeletonDrawableData = undefined
--
delSkeletonDrawableData :: MonadIO m => a -> m ()
delSkeletonDrawableData = undefined
--

class SkeletonDrawable a b where
    data RenderTarget :: * -> *
    update :: MonadIO m => a -> Float -> m a
    draw   :: MonadIO m => a -> renderTarget -> renderStates -> m a

instance SkeletonDrawable
