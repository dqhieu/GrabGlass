//
//  ContentView.swift
//  GrabGlass
//
//  Created by Dinh Quang Hieu on 18/6/25.
//

import SwiftUI

// MARK: - Constants

private enum Constant {
  static let headerHeight: CGFloat = 60
  static let categoryGridSpacing: CGFloat = 16
  static let categoryItemSize: CGFloat = 80
  static let cardCornerRadius: CGFloat = 12
  static let searchBarHeight: CGFloat = 44
  static let profileImageSize: CGFloat = 40
}

struct ContentView: View {

  @State private var searchText = ""

  var body: some View {
    TabView {
      // Home Tab
      Tab("Home", systemImage: "house") {
        homeView
      }
      
      // Discover Tab
      Tab("Discover", systemImage: "safari") {
        Text("Discover")
      }

      // Activity Tab
      Tab("Activity", systemImage: "list.bullet.rectangle.portrait") {
        activityView
      }

      // Finance Tab
      Tab("Finance", systemImage: "dollarsign.circle") {
        homeView
      }

      Tab(role: .search) {
        searchView
      }
    }
    .tabViewBottomAccessory(content: {
      MCAView()
    })
    .searchable(text: $searchText)
    .tabBarMinimizeBehavior(.onScrollDown)
    .accentColor(.green)
  }
  
  // MARK: - Home View
  
  private var homeView: some View {
    NavigationView {
      ScrollView {
        VStack(spacing: 0) {
          // Add top padding to account for floating header
          LinearGradient(
            stops: [
              Gradient.Stop(color: Color.green, location: 0),
              Gradient.Stop(color: Color.blue, location: 1),
            ],
            startPoint: .leading,
            endPoint: .trailing
          )
          .frame(height: 120)

          // MARK: - Service Categories
          serviceCategoriesSection

          // MARK: - Balance Cards
          balanceCardsSection

          // MARK: - Shop Now Section
          shopNowSection

          // MARK: - Advertisement Banner
          advertisementSection

          // MARK: - Challenges Section
          challengesSection

          // MARK: - Discover Section
          discoverSection

          // MARK: - Advertisement Banner
          shopNowSection
            .padding(.top, 28)
          advertisementSection

          // MARK: - Challenges Section
          challengesSection

          // MARK: - Discover Section
          discoverSection
        }
      }
      .ignoresSafeArea(.all, edges: .top)
      .scrollIndicators(.hidden)
      .toolbar {
        ToolbarItem(placement: .primaryAction) {
          Image(systemName: "barcode.viewfinder")
            .frame(width: 44, height: 44)
        }
        ToolbarSpacer(.fixed, placement: .primaryAction)
        ToolbarItem(placement: .primaryAction) {
          Image(systemName: "person.fill")
            .frame(width: 44, height: 44)
        }
      }

    }
    .overlay(alignment: .bottom) {
      HStack {
        Button {

        } label: {
          Image(systemName: "mic.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding()

        }
        .frame(width: 60, height: 60)
        .foregroundStyle(.white)
        .glassEffect(.regular.tint(.blue))
        Spacer()
      }
      .padding()
    }
  }
  
  // MARK: - Search View
  
  private var searchView: some View {
    NavigationView {
      VStack(spacing: 0) {
        // Header with location and back button
        searchHeaderSection
        
        // Search bar
//        searchBarSection
        
        // Filter tabs
        filterTabsSection
        
        ScrollView {
          VStack(alignment: .leading, spacing: 24) {
            // Book a ride section
            bookRideSection
            
            // Recent & popular section
            recentPopularSection
            
            // Recommended section
            recommendedSection
          }
          .padding(.horizontal, 16)
        }
      }
      .navigationBarHidden(true)
    }
  }
  
  // MARK: - Search Header Section
  
  private var searchHeaderSection: some View {
    HStack {
      Button(action: {}) {
        Image(systemName: "arrow.left")
          .font(.system(size: 20))
          .foregroundColor(.black)
      }
      
      VStack(alignment: .leading, spacing: 2) {
        Text("Your location")
          .font(.system(size: 14))
          .foregroundColor(.gray)
        
        HStack {
          Text("Lobby")
            .font(.system(size: 20, weight: .medium))
            .foregroundColor(.black)
          
          Image(systemName: "chevron.down")
            .font(.system(size: 16))
            .foregroundColor(.black)
        }
      }
      
      Spacer()
    }
    .padding(.horizontal, 16)
    .padding(.vertical, 12)
  }
  
  // MARK: - Search Bar Section
  
  private var searchBarSection: some View {
    HStack {
      Image(systemName: "magnifyingglass")
        .font(.system(size: 16))
        .foregroundColor(.gray)
      
      Text("Search places")
        .font(.system(size: 16))
        .foregroundColor(.gray)
      
      Spacer()
    }
    .padding(.horizontal, 16)
    .padding(.vertical, 12)
    .background(Color.gray.opacity(0.1))
    .cornerRadius(12)
    .padding(.horizontal, 16)
    .padding(.bottom, 16)
  }
  
  // MARK: - Filter Tabs Section
  
  private var filterTabsSection: some View {
    HStack(spacing: 12) {
      FilterTab(title: "All", isSelected: true)
      FilterTab(title: "Transport", isSelected: false, icon: "car.fill")
      FilterTab(title: "Food", isSelected: false, icon: "fork.knife")
      
      Spacer()
    }
    .padding(.horizontal, 16)
    .padding(.bottom, 24)
  }
  
  // MARK: - Book Ride Section
  
  private var bookRideSection: some View {
    VStack(alignment: .leading, spacing: 16) {
      Text("Book a ride")
        .font(.system(size: 20, weight: .bold))
        .foregroundColor(.black)
      
      VStack(spacing: 12) {
        LocationItem(
          icon: "house.fill",
          iconColor: .green,
          title: "Home",
          subtitle: "10km • Basement Lobby, Tower 10 (Units 36-42), 10 Sims Dri...",
          showRecentlyUsed: true
        )
        
        LocationItem(
          icon: "location.fill",
          iconColor: .green,
          title: "Kick Off! (formerly Kovan Sports Centre)",
          subtitle: "13km • 60 Hougang Street 21, Singapore, 538738",
          showRecentlyUsed: false
        )
        
        LocationItem(
          icon: "clock.fill",
          iconColor: .black,
          title: "Terminal 3 Departure - Changi Airport",
          subtitle: "23km • 65 Airport Boulevard, Singapore, 819663",
          showRecentlyUsed: true
        )
      }
    }
  }
  
  // MARK: - Recent & Popular Section
  
  private var recentPopularSection: some View {
    VStack(alignment: .leading, spacing: 16) {
      Text("Recent & popular")
        .font(.system(size: 20, weight: .bold))
        .foregroundColor(.black)
      
      LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 12), count: 3), spacing: 12) {
        RecentPopularItem(icon: "clock.fill", title: "terminal 3")
        RecentPopularItem(icon: "arrow.up.right", title: "mcdonald's", iconColor: .orange)
        RecentPopularItem(icon: "clock.fill", title: "changi")
        RecentPopularItem(icon: "arrow.up.right", title: "cake", iconColor: .orange)
        RecentPopularItem(icon: "clock.fill", title: "bouna vista")
        RecentPopularItem(icon: "arrow.up.right", title: "chagee", iconColor: .orange)
      }
    }
  }
  
  // MARK: - Recommended Section
  
  private var recommendedSection: some View {
    VStack(alignment: .leading, spacing: 16) {
      Text("Recommended")
        .font(.system(size: 20, weight: .bold))
        .foregroundColor(.black)
      
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 12) {
          RecommendedCard(
            title: "Mr. Coconut - Connexis",
            distance: "1.0km",
            rating: "4.7",
            imageUrl: "https://images.unsplash.com/photo-1546173159-315724a31696?w=300&h=200&fit=crop"
          )
          
          RecommendedCard(
            title: "KOI Thé - Anchorpoint Sh...",
            distance: "1.4km",
            rating: "4.8",
            imageUrl: "https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=300&h=200&fit=crop"
          )
          
          RecommendedCard(
            title: "Straits Club Alexandra - Buki...",
            distance: "1.4km",
            rating: "4.1",
            imageUrl: "https://images.unsplash.com/photo-1565299624946-b28f40a0ca4b?w=300&h=200&fit=crop",
            isAd: true
          )
        }
        .padding(.horizontal, 16)
      }
      .padding(.horizontal, -16)
    }
    .padding(.bottom, 100)
  }
  
  // MARK: - Header Section
  
  private var headerSection: some View {
    HStack(spacing: 0) {
      Text("Welcome back, Tony")
        .font(.title3)
        .fontWeight(.medium)
        .padding()
      Spacer(minLength: 0)
      // Profile Section
      AsyncImage(url: URL(string: "https://pbs.twimg.com/profile_images/1918875154568056832/UYxxcd60_400x400.jpg"), content: { image in
        image
          .resizable()
          .aspectRatio(contentMode: .fit)
          .clipShape(.circle)
      }, placeholder: {
        ProgressView()
      })
        .frame(width: Constant.profileImageSize, height: Constant.profileImageSize)
        .glassEffect()
        .padding()
    }
    .frame(height: Constant.headerHeight)
    .frame(maxWidth: .infinity)
  }
  
  // MARK: - Service Categories
  
  private var serviceCategoriesSection: some View {
    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: Constant.categoryGridSpacing), count: 4), spacing: Constant.categoryGridSpacing) {
      ServiceCategoryItem(icon: "https://icons.grab.com/tiles/car/img_car_4x.png", title: "Transport")
      ServiceCategoryItem(icon: "https://icons.stg-myteksi.com/services/v1/food/img_food_4x.png", title: "Food")
      ServiceCategoryItem(icon: "https://assets-mobile.grab.com/cx/tiles/food/spn-icon/tile_food@4x.png", title: "Dine Out")
      ServiceCategoryItem(icon: "https://icons.stg-myteksi.com/tiles/groceries/img_mart_100k_4x.png", title: "Mart")
      ServiceCategoryItem(icon: "https://icons.stg-myteksi.com/tiles/v1/express/img_express_4x.png", title: "Express")
      ServiceCategoryItem(icon: "https://icons.stg-myteksi.com/tiles/v1/express/img_express_4x.png", title: "Chope")
      ServiceCategoryItem(icon: "https://icons.stg-myteksi.com/tiles/v1/express/img_express_4x.png", title: "Shopping")
      ServiceCategoryItem(icon: "https://icons.stg-myteksi.com/tiles/v1/express/img_express_4x.png", title: "All")
    }
    .padding(.horizontal, 16)
    .padding(.vertical, 24)
  }
  
  // MARK: - Balance Cards
  
  private var balanceCardsSection: some View {
    HStack(spacing: 12) {
      // Balance Card
      BalanceCard(
        title: "Balance",
        amount: "S$ 2.98",
        icon: "dollarsign.circle.fill",
        iconColor: .green
      )
      
      // GrabRewards Card
      BalanceCard(
        title: "GrabRewards",
        amount: "1,337",
        icon: "crown.fill",
        iconColor: .yellow
      )
    }
    .padding(.horizontal, 16)
    .padding(.bottom, 24)
  }
  
  // MARK: - Shop Now Section
  
  private var shopNowSection: some View {

    HStack {
      Text("Shop now")
        .font(.system(size: 24, weight: .bold))
        .foregroundColor(.black)
      
      Image(systemName: "arrow.right.circle.fill")
        .font(.system(size: 20))
        .foregroundColor(.gray)
      
      Spacer()
    }
    .padding(.horizontal, 16)
    .padding(.bottom, 16)
  }
  
  // MARK: - Advertisement Section
  
  private var advertisementSection: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(spacing: 12) {
        // Singtel Ad
        AdBannerView(
          title: "Singtel CIS: Up to 25% OFF 5G+ plans",
          subtitle: "Ad • Singtel CIS",
          imageURL: "https://d2ck5hmeaxjxox.cloudfront.net/images/522008597018717514/1IjMzETN0UTO5YzM2cjNzMTM?Expires=1752208525&Signature=kW2n60T4i1~f6ys-QKP1ZbqXAGMo-4y6iFA5LJDWCAGEhz9~SUPosJmQX2hOjudaICxcjf3-4xTsevPghheiq9zM8-sJCe-SJ0UcGegiRhpIX43s2ycXip90UN51--l3JqGo7PX8FkdLw56sTWKzg9u7H-PZNEjqkqA7xjxol7HeRES4KTWEtVG6j1ZIlTZDvGudLtKHVgtKlFnE7DJXXEQ9Z~dplknD1au6uP7TSluaJg~9IOvM01t1E~6IBbTX7zvQnVNAAorCWDwhjAkPxioayt3oQ90MZWU8fNElsimuo6CGAPi-DNkMtPLHuNXRc8bU77VUzD0mh4BayEoOvg__&Key-Pair-Id=K2MGLN1GI3325M"
        )
        
        // Another Ad placeholder
        AdBannerView(
          title: "Priv",
          subtitle: "Ad • ",
          imageURL: "https://d2ck5hmeaxjxox.cloudfront.net/images/525808709792701663/wcTOyMDM1UDN5IzN3YDN3QTM?Expires=1760428816&Signature=bwKAS5fMChBO1m0jwY7CPOH1v8yaDonALcy1MXsAUlYEphoK8jbpOEZsy7dfjMXYRvS5nk9KBjs6purRAu3ZPFB7KpWjeyzQLq6AGGBOjsnxuNUJricymvfJ2dLGyu3SaVo~bZ4vpJ0SoyV-iLx7XnxPlEbHESsrD0t8-TNJ3oGL4vVvZceYNrc3SYGYG8l4FRXSBhT3ZXeVpYQP2XeT2wSHMVib9j~kt2X-vWR3fosSrGPghxpLD~9kveRN4FIrPzawK7EVvM1~qRIe-K8I7xCZs1HdjviwJbrygr6Styp4uGgWhQ99l9BE6~zZn4yJPBZ707J9zw3iLGVl0fScmQ__&Key-Pair-Id=K2MGLN1GI3325M"
        )
      }
      .padding(.horizontal, 16)
    }
    .padding(.bottom, 24)
  }
  
  // MARK: - Challenges Section
  
  private var challengesSection: some View {
    VStack(alignment: .leading, spacing: 16) {
      Text("Get rewarded with Challenges")
        .font(.system(size: 20, weight: .bold))
        .foregroundColor(.black)
        .padding(.horizontal, 16)
      
      ChallengeCard()
        .padding(.horizontal, 16)
    }
    .padding(.bottom, 24)
  }
  
  // MARK: - Discover Section
  
  private var discoverSection: some View {
    VStack(alignment: .leading, spacing: 16) {
      VStack(alignment: .leading, spacing: 4) {
        Text("Discover things you'd love")
          .font(.system(size: 20, weight: .bold))
          .foregroundColor(.black)
        
        Text("Ad • Swipe to be inspired")
          .font(.system(size: 14))
          .foregroundColor(.gray)
      }
      .padding(.horizontal, 16)
      
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 12) {
          DiscoverCard(
            title: "Dyson ad | test",
            subtitle: "[Atlas] Grab",
            description: "[Atlas] Atlas\nDyson ad | test",
            backgroundColor: Color.gray.opacity(0.1),
            textColor: .white,
            imageUrl: "https://d2ck5hmeaxjxox.cloudfront.net/images/522008597018717514/0ADN5MTO5MjMxAzN0UDO2QTM?Expires=1760063423&Signature=gT4Y6dicQB609v21drRgm2NXbRMVMzDcvJ0giGSj615C9u2Svg6JFy~2Z5ppjJ9oeTpIgONHyidtbA16nq8VGGLVVZkVnSciw5IPwmchkdIs2afxrDKD4rjctzwjjbsmFJfRv69-QequcKQqhXVzTSCSGQnwP-4~icEcRd4b~Krmas7Nj7UkmBwIDx1KgqcaRSIhVVwWUDmYRLfMjXJOY3yJA0zQHgBwJgxvCbiptJTxwOg-NvIRljPDN46DN3o-ams4A~Ft7CmFEFdoSIl1xG-n8L0YL-OD-IPqLe9qwc1ecp80wh5cTSwQUPHjJGMotTqJF3WUaRUbJA6BZHORFA__&Key-Pair-Id=K2MGLN1GI3325M"
          )
          
          DiscoverCard(
            title: "Test mode: GAM\nDiskon tiap pesen",
            subtitle: "Grab ID",
            description: "",
            backgroundColor: Color.black,
            textColor: .white,
            imageUrl: "https://d3vpva6y8kidud.cloudfront.net/thumbnails/5UjNxcDOxETO3UTO4cDNwMTM/5MTN0kTN3EDO2kjMwgDNwMTM.webp?Expires=1753535700&Signature=gfbI9XksF0xM5YMt-xzDtH9iq-ZTh1zmYuRKOniZ5Sg84DMGXqZuHWsQfdPSNpWaWtj3TX7J6ZXMcejBMqsl3SIvGtXhBCMOBQNQJMkInGO2nYROq1C-cE79632mPHVKS7yl1wr9YNhy2dXFzr8wrevVxEBx4K1s6KdVM3aTLgMXd-CyTQzCzwYDQ76vvEb9699AzeRgMnaKbXh-LbFqIS9axEdHf61PLxv-at8Eb5mN-XEpHbrHWNV6SuObnX4e~~aM6IhZb7i6q-SYLzF7VbMPV-EqqwWarOYx63pFPPaIbrCLVninc3fip5Ierntg7sMONryd2vVp1~UyNwbXoQ__&Key-Pair-Id=KW6EOI5GKLCR7"
          )
          
          DiscoverCard(
            title: "AUTO\neo_Ad",
            subtitle: "ByGrab",
            description: "",
            backgroundColor: Color.orange.opacity(0.1),
            textColor: .white,
            imageUrl: "https://d2ck5hmeaxjxox.cloudfront.net/thumbnails/0ADM3ETO5gzN4UDO2UDO2QTM/0IzMxAzNxkTN0ATO2UDO2QTM.webp?Expires=1760064737&Signature=c73mIBOkqKjF7ywDeieevNy4OFJcX5YRU-wQF6zcAxVREjpcWyJIGjuXNRZ1~dVHZdA2dctqKxg4pqOWE3ETbMj3ETI8A~jgfrdibaZ2ELi-UtfoRlXc9ITJWFdBskzTMG68oAJS0a11J9gwgdRorKUkUlI~5ubShBwweNHF0yt~5JSHqu27l1Pd4k9k6PvHY901QKTcjXzpMZODK7I8oJYl0FaaicDNfGwBf0FHFPIfpBjUBbMGAR9QITY7D6TGBxVn7OR~BS30wwkoKY30-VbZzbovF2heLsyyWKKGjGqmiQDMkBiOECCvmKBZ0MakGI-fUyqlwvxbS6gIIJ02TQ__&Key-Pair-Id=K2MGLN1GI3325M"
          )
        }
        .padding(.horizontal, 16)
      }
    }
  }
  
  // MARK: - Activity View
  
  private var activityView: some View {
    NavigationView {
      ScrollView {
        VStack(spacing: 0) {
          // Points Card Section
          pointsCardSection
          
          // Recent Transactions Section
          recentTransactionsSection
        }
        .padding(.top, 16)
      }
      .navigationTitle("Activity")
      .toolbar {
        ToolbarItem(placement: .primaryAction) {
          Image(systemName: "list.bullet.rectangle.portrait")
            .frame(width: 44, height: 44)
        }
      }
    }
  }
  
  // MARK: - Points Card Section
  
  private var pointsCardSection: some View {
    VStack(spacing: 0) {
      HStack(spacing: 16) {
        // Gift icon
        Image(systemName: "gift.fill")
          .font(.system(size: 32))
          .foregroundColor(.green)
        
        VStack(alignment: .leading, spacing: 4) {
          Text("You have 1,349 points now")
            .font(.system(size: 20, weight: .bold))
            .foregroundColor(.black)
          
          Text("Use them to redeem exclusive items!")
            .font(.system(size: 16))
            .foregroundColor(.gray)
        }
        
        Spacer()
      }
      .padding(20)
      
      HStack {
        Button("Explore GrabRewards") {
          // Handle explore rewards action
        }
        .font(.system(size: 16, weight: .medium))
        .foregroundColor(.blue)
        
        Spacer()
      }
      .padding(.horizontal, 20)
      .padding(.bottom, 20)
    }
    .background(Color.white)
    .cornerRadius(12)
    .overlay(
      RoundedRectangle(cornerRadius: 12)
        .stroke(Color.gray.opacity(0.2), lineWidth: 1)
    )
    .padding(.horizontal, 16)
    .padding(.bottom, 24)
  }
  
  // MARK: - Recent Transactions Section
  
  private var recentTransactionsSection: some View {
    VStack(alignment: .leading, spacing: 0) {
      HStack {
        Text("Recent")
          .font(.system(size: 24, weight: .bold))
          .foregroundColor(.black)
        
        Spacer()
      }
      .padding(.horizontal, 16)
      .padding(.bottom, 16)
      
      VStack(spacing: 0) {
        TransactionItem(
          icon: "g.circle.fill",
          iconColor: .green,
          title: "Sodexo (Online)",
          subtitle: "18 Jun 2025, 17:24",
          amount: "S$6.20",
          amountColor: .black
        )
        
        TransactionItem(
          icon: "car.fill",
          iconColor: .green,
          title: "Golden Star Apartment - Pick Up/Drop Off Gate to Crescent Mall...",
          subtitle: "Booked by Hà Bảo Khanh\n17 Jun 2025, 19:23",
          amount: "30.000đ\n+4 points",
          amountColor: .black
        )
        
        TransactionItem(
          icon: "g.circle.fill",
          iconColor: .green,
          title: "Sodexo (Online)",
          subtitle: "17 Jun 2025, 17:25",
          amount: "S$6.20",
          amountColor: .black
        )
        
        TransactionItem(
          icon: "plus.circle.fill",
          iconColor: .green,
          title: "Top-up to GrabPay Wallet",
          subtitle: "17 Jun 2025, 17:24",
          amount: "S$10.00",
          amountColor: .green
        )
        
        TransactionItem(
          icon: "car.fill",
          iconColor: .green,
          title: "Pho Thin By Sol - 1 Pho Tieu Nam to Golden Star Apartment - Pick...",
          subtitle: "Booked by Hà Bảo Khanh\n17 Jun 2025, 11:26",
          amount: "31.000đ\n+4 points",
          amountColor: .black
        )
        
        TransactionItem(
          icon: "car.fill",
          iconColor: .red,
          title: "Pho Thin By Sol - 1 Pho Tieu Nam to Golden Star Apartment - Pick Up/Drop...",
          subtitle: "Booked by Hà Bảo Khanh",
          amount: "",
          amountColor: .black,
          isCancelled: true
        )
      }
    }
  }
}

// MARK: - Supporting Views

struct ServiceCategoryItem: View {
  let icon: String
  let title: String
  
  var body: some View {
    VStack(spacing: 8) {
      RoundedRectangle(cornerRadius: 16)
        .fill(Color.green.opacity(0.1))
        .frame(width: Constant.categoryItemSize, height: Constant.categoryItemSize)
        .overlay(
          AsyncImage(url: URL(string: icon), content: { image in
            image
              .resizable()
              .aspectRatio(contentMode: .fit)
              .padding()
          }, placeholder: {
            ProgressView()
          })
        )
      
      Text(title)
        .font(.system(size: 14, weight: .semibold))
        .foregroundColor(.black)
    }
  }
}

struct BalanceCard: View {
  let title: String
  let amount: String
  let icon: String
  let iconColor: Color
  
  var body: some View {
    HStack {
      VStack(alignment: .leading, spacing: 4) {
        Text(title)
          .font(.system(size: 14))
          .foregroundColor(.gray)
        
        Text(amount)
          .font(.system(size: 20, weight: .bold))
          .foregroundColor(.black)
      }
      
      Spacer()
      
      Image(systemName: icon)
        .font(.system(size: 24))
        .foregroundColor(iconColor)
    }
    .padding(16)
    .background(Color.white)
    .cornerRadius(Constant.cardCornerRadius)
    .overlay(
      RoundedRectangle(cornerRadius: Constant.cardCornerRadius)
        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
    )
  }
}

struct AdBannerView: View {
  let title: String
  let subtitle: String
  let imageURL: String

  var body: some View {
    VStack {
      AsyncImage(url: URL(string: imageURL)) { image in
        image
          .resizable()
          .aspectRatio(contentMode: .fill)
      } placeholder: {
        Color.gray.opacity(0.3)
      }
      .frame(width: 360, height: 160)
      .clipShape(.rect(cornerRadius: 16, style: .continuous))

      VStack(alignment: .leading, spacing: 8) {
        Spacer()

        Text(title)
          .font(.system(size: 16, weight: .bold))
          .foregroundColor(.black)
          .multilineTextAlignment(.leading)

        Text(subtitle)
          .font(.system(size: 12))
          .foregroundColor(.gray)
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
    }
  }
}

struct ChallengeCard: View {
  var body: some View {
    HStack(spacing: 12) {
      
      VStack(alignment: .leading, spacing: 4) {
        Text("Win $10 OFF next Thurs transaction!")
          .font(.system(size: 16, weight: .semibold))
          .foregroundColor(.black)
        
        Text("Ends on 30 Jun 2025")
          .font(.system(size: 14))
          .foregroundColor(.gray)
        
        Text("Accept this challenge")
          .font(.system(size: 14, weight: .medium))
          .foregroundColor(.blue)
      }
      
      Spacer()
      
      // Google Pay icon placeholder
      Circle()
        .fill(Color.gray.opacity(0.1))
        .frame(width: 40, height: 40)
        .overlay(
          Image(systemName: "g.circle.fill")
            .font(.system(size: 24))
            .foregroundColor(.blue)
        )
    }
    .padding(16)
    .background(Color.white)
    .cornerRadius(Constant.cardCornerRadius)
    .overlay(
      RoundedRectangle(cornerRadius: Constant.cardCornerRadius)
        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
    )
  }
}

struct DiscoverCard: View {
  let title: String
  let subtitle: String
  let description: String
  let backgroundColor: Color
  let textColor: Color
  let imageUrl: String?
  
  init(title: String, subtitle: String, description: String, backgroundColor: Color, textColor: Color, imageUrl: String? = nil) {
    self.title = title
    self.subtitle = subtitle
    self.description = description
    self.backgroundColor = backgroundColor
    self.textColor = textColor
    self.imageUrl = imageUrl
  }
  
  var body: some View {
    ZStack {
      // Background image if provided
      if let imageUrl = imageUrl, let url = URL(string: imageUrl) {
        AsyncImage(url: url) { image in
          image
            .resizable()
            .aspectRatio(contentMode: .fill)
        } placeholder: {
          Color.gray.opacity(0.3)
        }
        .clipped()
      }
      
      // Content overlay
      VStack(alignment: .leading, spacing: 8) {
        Spacer()
        
        if !description.isEmpty {
          Text(description)
            .font(.system(size: 12))
            .foregroundColor(textColor.opacity(0.7))
            .multilineTextAlignment(.leading)
        }
        
        Text(title)
          .font(.system(size: 16, weight: .bold))
          .foregroundColor(textColor)
          .multilineTextAlignment(.leading)
        
        Text(subtitle)
          .font(.system(size: 12))
          .foregroundColor(textColor.opacity(0.7))
      }
      .padding(16)
      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
    }
    .frame(width: 200, height: 350)
    .background(backgroundColor)
    .cornerRadius(Constant.cardCornerRadius)
    .clipped()
  }
}

// MARK: - Search Supporting Views

struct FilterTab: View {
  let title: String
  let isSelected: Bool
  let icon: String?
  
  init(title: String, isSelected: Bool, icon: String? = nil) {
    self.title = title
    self.isSelected = isSelected
    self.icon = icon
  }
  
  var body: some View {
    HStack(spacing: 6) {
      if let icon = icon {
        Image(systemName: icon)
          .font(.system(size: 14))
          .foregroundColor(isSelected ? .white : .gray)
      }
      
      Text(title)
        .font(.system(size: 14, weight: .medium))
        .foregroundColor(isSelected ? .white : .gray)
    }
    .padding(.horizontal, 16)
    .padding(.vertical, 8)
    .background(isSelected ? Color.green : Color.gray.opacity(0.1))
    .cornerRadius(20)
  }
}

struct LocationItem: View {
  let icon: String
  let iconColor: Color
  let title: String
  let subtitle: String
  let showRecentlyUsed: Bool
  
  var body: some View {
    HStack(spacing: 12) {
      Circle()
        .fill(iconColor.opacity(0.1))
        .frame(width: 40, height: 40)
        .overlay(
          Image(systemName: icon)
            .font(.system(size: 18))
            .foregroundColor(iconColor)
        )
      
      VStack(alignment: .leading, spacing: 4) {
        Text(title)
          .font(.system(size: 16, weight: .medium))
          .foregroundColor(.black)
        
        Text(subtitle)
          .font(.system(size: 14))
          .foregroundColor(.gray)
          .lineLimit(1)
        
        if showRecentlyUsed {
          HStack(spacing: 4) {
            Image(systemName: "star.fill")
              .font(.system(size: 12))
              .foregroundColor(.green)
            
            Text("Recently used")
              .font(.system(size: 12))
              .foregroundColor(.green)
          }
        }
      }
      
      Spacer()
    }
    .padding(.vertical, 8)
  }
}

struct RecentPopularItem: View {
  let icon: String
  let title: String
  let iconColor: Color
  
  init(icon: String, title: String, iconColor: Color = .gray) {
    self.icon = icon
    self.title = title
    self.iconColor = iconColor
  }
  
  var body: some View {
    HStack(spacing: 8) {
      Image(systemName: icon)
        .font(.system(size: 14))
        .foregroundColor(iconColor)
      
      Text(title)
        .font(.system(size: 14))
        .foregroundColor(.black)
        .lineLimit(1)
      
      Spacer(minLength: 0)
    }
    .padding(.horizontal, 12)
    .padding(.vertical, 10)
    .background(Color.gray.opacity(0.1))
    .cornerRadius(20)
  }
}

struct RecommendedCard: View {
  let title: String
  let distance: String
  let rating: String
  let imageUrl: String
  let isAd: Bool
  
  init(title: String, distance: String, rating: String, imageUrl: String, isAd: Bool = false) {
    self.title = title
    self.distance = distance
    self.rating = rating
    self.imageUrl = imageUrl
    self.isAd = isAd
  }
  
  var body: some View {
    VStack(alignment: .leading, spacing: 8) {
      AsyncImage(url: URL(string: imageUrl)) { image in
        image
          .resizable()
          .aspectRatio(contentMode: .fill)
      } placeholder: {
        Color.gray.opacity(0.3)
      }
      .frame(width: 150, height: 100)
      .clipShape(.rect(cornerRadius: 8, style: .continuous))
      
      VStack(alignment: .leading, spacing: 4) {
        Text(title)
          .font(.system(size: 14, weight: .medium))
          .foregroundColor(.black)
          .lineLimit(2)
        
        HStack(spacing: 4) {
          if isAd {
            Text("Ad")
              .font(.system(size: 12))
              .foregroundColor(.gray)
            
            Text("•")
              .font(.system(size: 12))
              .foregroundColor(.gray)
          }
          
          Text(distance)
            .font(.system(size: 12))
            .foregroundColor(.gray)
          
          Text("•")
            .font(.system(size: 12))
            .foregroundColor(.gray)
          
          HStack(spacing: 2) {
            Image(systemName: "star.fill")
              .font(.system(size: 10))
              .foregroundColor(.yellow)
            
            Text(rating)
              .font(.system(size: 12))
              .foregroundColor(.gray)
          }
        }
      }
    }
    .frame(width: 150)
  }
}

struct TransactionItem: View {
  let icon: String
  let iconColor: Color
  let title: String
  let subtitle: String
  let amount: String
  let amountColor: Color
  let isCancelled: Bool
  
  init(icon: String, iconColor: Color, title: String, subtitle: String, amount: String, amountColor: Color, isCancelled: Bool = false) {
    self.icon = icon
    self.iconColor = iconColor
    self.title = title
    self.subtitle = subtitle
    self.amount = amount
    self.amountColor = amountColor
    self.isCancelled = isCancelled
  }
  
  var body: some View {
    HStack(spacing: 16) {
      // Icon
      Circle()
        .fill(iconColor.opacity(0.1))
        .frame(width: 48, height: 48)
        .overlay(
          Image(systemName: icon)
            .font(.system(size: 20))
            .foregroundColor(iconColor)
        )
      
      // Content
      VStack(alignment: .leading, spacing: 4) {
        if isCancelled {
          VStack(alignment: .leading, spacing: 2) {
            Text("Sorry, driver cancelled")
              .font(.system(size: 16, weight: .medium))
              .foregroundColor(.red)
            
            Text(title)
              .font(.system(size: 16, weight: .medium))
              .foregroundColor(.black)
              .multilineTextAlignment(.leading)
          }
        } else {
          Text(title)
            .font(.system(size: 16, weight: .medium))
            .foregroundColor(.black)
            .multilineTextAlignment(.leading)
        }
        
        Text(subtitle)
          .font(.system(size: 14))
          .foregroundColor(.gray)
          .multilineTextAlignment(.leading)
      }
      
      Spacer()
      
      // Amount
      if !amount.isEmpty {
        VStack(alignment: .trailing, spacing: 2) {
          ForEach(amount.components(separatedBy: "\n"), id: \.self) { line in
            Text(line)
              .font(.system(size: 16, weight: .medium))
              .foregroundColor(amountColor)
              .multilineTextAlignment(.trailing)
          }
        }
      }
    }
    .padding(.horizontal, 16)
    .padding(.vertical, 12)
  }
}

#Preview {
  ContentView()
}
