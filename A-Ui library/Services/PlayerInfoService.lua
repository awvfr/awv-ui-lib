local Players = game:GetService("Players")

local PlayerInfoService = {}

function PlayerInfoService:GetBasicInfo(player)
    player = player or Players.LocalPlayer

    local info = {
        Username = player.Name,
        DisplayName = player.DisplayName,
        UserId = player.UserId,
        AccountAge = player.AccountAge,
        MembershipType = tostring(player.MembershipType),
        IsPremium = player.MembershipType == Enum.MembershipType.Premium
    }

    return info
end

function PlayerInfoService:GetAvatar(userId)
    local thumbnailType = Enum.ThumbnailType.HeadShot
    local thumbnailSize = Enum.ThumbnailSize.Size420x420

    local image, ready = Players:GetUserThumbnailAsync(userId, thumbnailType, thumbnailSize)

    return image, ready
end

return PlayerInfoService