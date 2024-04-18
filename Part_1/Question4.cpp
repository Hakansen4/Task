void Game::addItemToPlayer(const std::string& recipient, uint16_t itemId)
{
    Player* player = g_game.getPlayerByName(recipient);
    if (!player) {
        player = new Player(nullptr);
        if (!IOLoginData::loadPlayerByName(player, recipient)) {
            delete player; // Free memory allocated for player
            return;
        }
    }

    Item* item = Item::CreateItem(itemId);
    if (!item) {
        delete player; // Free memory allocated for player
        return;
    }

    g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT);

    if (player->isOffline()) {
        IOLoginData::savePlayer(player);
		delete player;
    }
    delete item; // Free memory allocated for item. Assuming internalAddItem makes a copy or takes ownership of the 'item' object.
}
