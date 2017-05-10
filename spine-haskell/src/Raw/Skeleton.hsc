{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE PatternSynonyms #-}
--
module Spine.Raw.Skeleton where
--
#include "Skeleton.h"
--
import Foreign.C.Types
--
pattern IMG_INIT_JPG = (#const IMG_INIT_JPG) :: IIFlag
