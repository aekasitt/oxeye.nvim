/* ~~/src/lib.rs */

use mlua::lua_module;
use mlua::prelude::{Lua, LuaResult, LuaTable};
use rand::{Rng, thread_rng};
use rsille::Animation;
use rsille::Canvas;
use rsille::Paint;
use rsille::RsilleErr;
use rsille::extra::LifeGame;

const FRAMES_PER_SECOND: u32 = 24;
const RUNTIME_SECONDS: u64 = 10;
const MAX_FRAMES: u64 = RUNTIME_SECONDS * FRAMES_PER_SECOND as u64;

struct LifeGameWrapper {
  frames: u64,
  life_game: LifeGame,
}

impl LifeGameWrapper {
  fn new() -> Self {
    let size = 40;
    let mut pattern: String = String::new();
    let mut rng = thread_rng();
    for _ in 0..size {
      for _ in 0..size {
        pattern.push(if rng.gen_bool(0.3) { 'o' } else { 'b' });
      }
      pattern.push('$');
    }
    pattern.push('!');
    let life_game = LifeGame::from(&format!(
      "x = {}, y = {}, rule = B3/S23\n{}",
      size, size, pattern
    ))
    .expect("Failed to create life game");

    Self {
      frames: 0,
      life_game,
    }
  }

  fn update(&mut self) -> bool {
    self.frames += 1;
    if self.frames >= MAX_FRAMES {
      return true;
    }
    self.life_game.update();
    false
  }
}

impl Paint for LifeGameWrapper {
  fn paint<T>(&self, canvas: &mut Canvas, x: T, y: T) -> Result<(), RsilleErr>
  where
    T: Into<f64>,
  {
    self.life_game.paint(canvas, x, y)
  }
}


#[lua_module]
fn game_of_life(lua: &Lua) -> LuaResult<LuaTable> {
  let exports = lua.create_table()?;
  exports.set("run", lua.create_function(run)?)?;
  Ok(exports)
}

fn run(_: &Lua, _: ()) -> LuaResult<()> {
  let wrapper = LifeGameWrapper::new();
  let mut anime = Animation::new();
  anime.set_fps(FRAMES_PER_SECOND);
  anime.push(
    wrapper,
    |wrapper| wrapper.update(),
    (0, 0),
  );
  anime.run();
  Ok(())
}
