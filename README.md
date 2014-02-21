[![Stories in Ready](https://badge.waffle.io/RORLabNew/rorla_api.png?label=ready)](https://waffle.io/RORLabNew/rorla_api)
RORLa-API (로라 API)
========

: ROR Lab. 웹사이트 리뉴얼 공개 프로젝트

ROR Lab.이 시작된지 언 2년이 지났습니다. 그동안 사용하던, 그렇지만 그렇게 활성화 되지 못했던 공식 웹사이트를 리뉴얼을 하고자 합니다.

ROR Lab.의 공유정신은 웹사이트 리뉴얼에도 그대로 이어져 누구나 참여할 수 있는 공개 프로젝트로 진행하고자 합니다.

[Wiki](https://github.com/RORLabNew/rorla_api/wiki)

Facebook [루비 온 레일즈 코리아(비공개)](https://www.facebook.com/groups/rubyonrailskorea), [리뉴얼(비공개)](https://www.facebook.com/groups/rorlabrenewal)

Development Stack
-------

* Back-end
  *  Rails API
* Front-end
  * AngularJS for Web site
* MobileApp
  * Android App for Android device
  * iphone App for Apple Device


Collaboration Tools
------

* [Github](https://github.com/RORLabNew/rorla_api)
* [Waffle.io](https://waffle.io/RORLabNew/rorla_api)
* [Slack](http://rorlab.slack.com)

"RORLa" Open Source Project에 기여하기
----
"로라" 오픈소스 프로젝트는 ROR Lab. 공식 웹사이트(http://rorlab.org)의 renewal 프로젝트로 레일스 프레임워크를 이용하여 API를 만드는 것을 첫번째 목표로 하고 있습니다.

여러분의 참여를 유도하기 위해서 오픈소스 프로젝트로 진행하고 있으며 중간에 기여하는 분들이 쉽게 참여할 수 있도록 지침서를 마련할 필요가 있어 이 문서를 작성합니다.

온라인 협업을 통해 개발을 진행하기 때문에 소스코드관리 툴의 선정이 무엇보다 중요합니다. 다양한 툴이 있지만, 아무래도 GitHub 서비스를 이용하는 것이 가장 손쉽고 이러한 온라인 협업을 위해 최적화된 웹환경이 아마도 최적의 툴로 누구나가 부인하지 못할 것입니다. 이제 GitHub를 소스코드 관리툴로 지정하고 누구라도 저장소를 fork하여 기여할 수 있습니다.

> 리뉴얼저장소 https://github.com/RORLabNew/rorla_api

`로라` 프로젝트는 기여자들이 자신의 커밋을 `pull request`하고 최종 커밋터가 머지하는 방식으로 협업과정을 진행합니다.

1. 우선, 리뉴얼저장소를 방문하여 우측상단에 있는 `Fork`버튼을 클릭하면 본인 계정에 `로라`저장소의 복사본이 만들어 집니다.
2. 본인의 저장소를 로컬머신에 `git clone` 하고 일련의 코딩 작업을 진행합니다.
3. 본인의 로컬머신에서 작업한 내용을 `git commit` 하고 원격저장소(본인의 GitHub 저장소)로 `git push` 합니다.
4. 본인이 작업한 커밋들을 리뉴얼저장소로 머지 요청하는 것을 `pull request`라고 합니다. 이후로는 `pull request`를 줄여서 `PR`이라고 기술하겠습니다. `PR` 방법은 두가지로 할 수 있습니다. 하나는 [GitHub 웹서비스에서 하는 것](http://happyrails.rorlab.org/ko/posts/67)이고, 다른 하나는 로컬머신의 [터미널에서 커맨트라인 명령어로 하는 방법](http://blog.remotty.com/blog/2013/12/29/hub-and-pull-request/)이 있습니다.
5. 본인이 `PR`한 것이 최종 머지되지 않는 한 계속해서 `PR`리스트에 남게 됩니다. 이러한 상황에서 추가 작업한 내용을 커밋/푸시하게 되면 이미 요청한 `PR`에 푸시된 커밋들이 추가되는 것을 확인할 수 있습니다. 따라서 이전 `PR`이 머지 되지 않은 상태에서는 또 다른 `PR`을 요청할 수는 없습니다.
6. 별도의 작업과정을 구분하고 싶을 때는 로컬머신에서 별도의 `git` 브랜치를 만들어 작업하고 후에 본인의 `PR`이 머지될 경우, 작업하고 있는 별도의 브랜치를 머지하면 될 것입니다.
6. 본인이 요청한 `PR`을 최종적으로 철회하고자 한다면 페이지 하단에 있는 `Close` 버튼을 클릭하면 됩니다.

TDD with RSpec
---

오픈소스 프로젝트로 진행되는 만큼 소스의 검증과정이 필수적입니다. 최근에는 이러한 테스트 환경을 쉽게 구축할 수 있어 보다 견고한 어플리케이션을 작성할 수 있습니다.

알다시피, 레일스 프레임워크를 이용하여 웹어플리케이션을 개발할 때는 이러한 테스트환경이 디폴트로 지원되기 때문에, 개발자는 손쉽게 테스트 주도하에 개발(`Test-Driven Development`)을 진행할 수 있습니다.

최근에는, 레일스 프레임워크에서 디폴트로 지원하는 테스트 프레임워크보다는, [`RSpec`](https://github.com/rspec/rspec)젬을 이용한 테스트를 선호하고 있습니다.

이미 리뉴얼저장소에는 `RSpec`젬을 이용한 테스트환경을 구축해 놓은 상태이므로 그냥 spec 파일을 작성하고 테스트하면 됩니다.

테스트 데이터를 효과적으로 사용하기 위해서 [`factory_girl`](https://github.com/thoughtbot/factory_girl) 젬도 설치되어 환경설정이 되어 있으므로 `spec/factories` 디렉토리에 `factory` 데이터를 작성하면 바로 사용할 수 있습니다.

또한 [`faker`](https://github.com/fzaninotto/Faker) 젬도 설치되어 있으므로 랜덤 데이터를 손쉽게 사용할 수 있습니다.

아래는 `로라` 프로젝트의 테스트 환경을 구축하기 위해서 적상한 Gemfile의 일부를 소개합니다.

```
group :development, :test do
  gem "rspec-rails", "~> 2.14.0"
  gem "factory_girl_rails", "~> 4.2.1"
  gem 'guard', '~> 2'
  gem 'guard-rspec',require: false
  gem 'spring'
  gem "spring-commands-rspec"
end

group :test do
  gem "faker", "~> 1.1.2"
  gem "capybara", "~> 2.1.0"
  gem "database_cleaner", "~> 1.0.1"
  gem "launchy", "~> 2.3.0"
  gem "selenium-webdriver", "~> 2.35.1"
  gem "shoulda-matchers"
end
```

Donation
------
* ROR Lab.의 지식공유 운동에 동참하기를 원하시는 분은 [여기](https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=donate%40rorlab%2eorg&lc=KR&item_name=ROR%20Lab%2e&item_number=1&currency_code=USD&bn=PP%2dDonationsBF%3abtn_donateCC_LG%2egif%3aNonHosted)로 기부할 수 있습니다.

